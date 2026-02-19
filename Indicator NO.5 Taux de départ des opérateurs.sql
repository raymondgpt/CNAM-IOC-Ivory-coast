/*Indicator NO.5 Taux de départ des opérateurs*/
--ODS LAYER
-- This table stores the enrollment and departure information of operators (in site).
DROP TABLE IF EXISTS ods.ods_fichiers_sources_fichier_operateur_enrolement;
CREATE TABLE ods.ods_fichiers_sources_fichier_operateur_enrolement (
  `observation_number` VARCHAR(255) NULL,
  `first_last_name` VARCHAR(255) NULL,
  `employee_id` VARCHAR(255) NULL,
  `job_function` VARCHAR(255) NULL,
  `department_direction` VARCHAR(255) NULL,
  `department` VARCHAR(255) NULL,
  `service` VARCHAR(255) NULL,
  `assigned_site` VARCHAR(255) NULL,
  `start_date` VARCHAR(255) NULL,
  `departure_date` VARCHAR(255) NULL,
  `departure_type` VARCHAR(255) NULL,
  `departure_reason` VARCHAR(255) NULL,
  `notice_respected` VARCHAR(255) NULL,
  `replacement_identified` VARCHAR(255) NULL,
  `replacement_name` VARCHAR(255) NULL,
  `transition_date` VARCHAR(255) NULL,
  `comments` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`observation_number`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`observation_number`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

-- DW LAYER
-- This table stores the enrollment and departure information of operators (in site).
DROP VIEW IF EXISTS dw.dw_fichier_operateur_enrolement;
CREATE VIEW dw.dw_fichier_operateur_enrolement COMMENT 'VIEW' AS
select
    observation_number,
    first_last_name,
    employee_id,
    job_function,
    department_direction,
    department,
    service,
    assigned_site,
    start_date,
    departure_date,
    departure_type,
    departure_reason,
    notice_respected,
    replacement_identified,
    replacement_name,
    transition_date,
    comments,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_fichier_operateur_enrolement`;


-- DM LAYER
-- This table calculates the monthly turnover rate of on-site operators (departures divided by active employees at the beginning of the month).
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_monthly;
CREATE  VIEW dm.dm_operator_turnover_rate_monthly COMMENT 'VIEW' AS
WITH all_months AS (
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month,INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            SELECT
                DATE_SUB(DATE_FORMAT(MIN(start_date), '%Y-%m-01'), INTERVAL 0 DAY) as first_day_of_first_month
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
            WHERE start_date IS NOT NULL
        ) first_month
        CROSS JOIN (SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1
        CROSS JOIN (SELECT 0 as t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
        WHERE DATE_ADD(
                first_day_of_first_month,
                INTERVAL (t2*10 + t1) MONTH
            ) <= CURDATE()
    ) month_dates
)
SELECT
    COALESCE(departure.departure_num, 0) as departure_num,
    COALESCE(active.active_num, 0) as active_num,
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / COALESCE(active.active_num, 0), 2)
    END as departure_rate,
    all_months.month_key as analysis_month,
    DATE_FORMAT(STR_TO_DATE(all_months.month_key,'%Y%m'), '%b-%Y') as month,
    COALESCE(departure.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM all_months
LEFT JOIN (
    SELECT
        DATE_FORMAT(departure_date, '%Y%m') as month_key,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE departure_date IS NOT NULL AND departure_date <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y%m')
) departure ON all_months.month_key = departure.month_key
LEFT JOIN (
    -- Number of active employees at the beginning of each month
    SELECT
        month_key,
        COUNT(DISTINCT employee_id) as active_num
    FROM (
        SELECT
            am.month_key,
            emp.employee_id
        FROM all_months am
        CROSS JOIN `internal`.`dw`.`dw_fichier_operateur_enrolement` emp
        WHERE emp.start_date IS NOT NULL
    ) emp_months
    WHERE
        EXISTS (
            SELECT 1
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement` e
            WHERE e.employee_id = emp_months.employee_id
            AND e.start_date <= STR_TO_DATE(CONCAT(emp_months.month_key, '01'), '%Y%m%d')
            AND (
                e.departure_date IS NULL
                OR e.departure_date='NULL'
                OR e.departure_date = ''
                OR e.departure_date > STR_TO_DATE(CONCAT(emp_months.month_key, '01'), '%Y%m%d')
            )
        )
    GROUP BY month_key
) active ON all_months.month_key = active.month_key
where active_num is not null
ORDER BY all_months.month_key;


-- This table calculates the annual turnover rate of on-site operators (annual departures divided by active employees at the beginning of the year).
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_yearly;
CREATE  VIEW dm.dm_operator_turnover_rate_yearly COMMENT 'VIEW' AS
WITH all_years AS (
    SELECT DISTINCT DATE_FORMAT(year_date, '%Y') as year_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_year,INTERVAL t1 YEAR) as year_date
        FROM (
            -- Get January 1st of the year with the earliest employee hire date
            SELECT
                DATE_FORMAT(MIN(start_date), '%Y-01-01') as first_day_of_first_year
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
            WHERE start_date IS NOT NULL
        ) first_year
        CROSS JOIN (SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1
        CROSS JOIN (SELECT 0 as t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2
        WHERE DATE_ADD(
                first_day_of_first_year,
                INTERVAL (t2*10 + t1) YEAR
            ) <= CURDATE()
    ) year_dates
)
SELECT
    COALESCE(departure.departure_num, 0) as departure_num,  
    COALESCE(active.active_num, 0) as active_num,         
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / COALESCE(active.active_num, 0), 2) 
    END as departure_rate,
    all_years.year_key as analysis_year,
    COALESCE(departure.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM all_years
LEFT JOIN (
    -- Annual number of departing employees
    SELECT
        DATE_FORMAT(departure_date, '%Y') as year_key,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE departure_date IS NOT NULL AND departure_date <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y')
) departure ON all_years.year_key = departure.year_key
LEFT JOIN (
    SELECT
        year_key,
        COUNT(DISTINCT employee_id) as active_num
    FROM (
        SELECT
            ay.year_key,
            emp.employee_id
        FROM all_years ay
        CROSS JOIN `internal`.`dw`.`dw_fichier_operateur_enrolement` emp
        WHERE emp.start_date IS NOT NULL
    ) emp_years
    WHERE
        -- Number of active employees at the beginning of each year (January 1st)
        EXISTS (
            SELECT 1
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement` e
            WHERE e.employee_id = emp_years.employee_id
            AND e.start_date <= STR_TO_DATE(CONCAT(emp_years.year_key, '0101'), '%Y%m%d')
            AND (
                e.departure_date IS NULL
                OR e.departure_date='NULL'
                OR e.departure_date = ''
                OR e.departure_date > STR_TO_DATE(CONCAT(emp_years.year_key, '0101'), '%Y%m%d')
            )
        )
    GROUP BY year_key
) active ON all_years.year_key = active.year_key
WHERE active_num IS NOT NULL
ORDER BY all_years.year_key;



-- This table calculates the monthly turnover rate of operators by each on-site (departures divided by active employees at the beginning of the month per site).
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_monthly_by_site;
CREATE VIEW dm.`dm_operator_turnover_rate_monthly_by_site` COMMENT 'VIEW' AS
WITH all_months AS (
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month, INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            SELECT
                DATE_SUB(DATE_FORMAT(MIN(start_date), '%Y-%m-01'), INTERVAL 0 DAY) as first_day_of_first_month
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
            WHERE start_date IS NOT NULL
        ) first_month
        CROSS JOIN (SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1
        CROSS JOIN (SELECT 0 as t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
        WHERE DATE_ADD(
                first_day_of_first_month,
                INTERVAL (t2*10 + t1) MONTH
            ) <= CURDATE()
    ) month_dates
),
all_sites AS (
    SELECT DISTINCT assigned_site
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE assigned_site IS NOT NULL AND assigned_site <> ''
),
month_site_combinations AS (
    SELECT
        am.month_key,
        s.assigned_site
    FROM all_months am
    CROSS JOIN all_sites s
)
SELECT
    msc.assigned_site,
    COALESCE(departure.departure_num, 0) as departure_num,
    COALESCE(active.active_num, 0) as active_num,
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / COALESCE(active.active_num, 0), 2)
    END as departure_rate,
    msc.month_key as analysis_month,
    year(STR_TO_DATE(msc.month_key,'%Y%m')) as year,
    DATE_FORMAT(STR_TO_DATE(msc.month_key,'%Y%m'), '%b-%Y') as month,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM month_site_combinations msc
LEFT JOIN (
    -- Monthly number of departing employees per assigned site
    SELECT
        DATE_FORMAT(departure_date, '%Y%m') as month_key,
        assigned_site,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE departure_date IS NOT NULL
      AND departure_date <> ''
      AND assigned_site IS NOT NULL
      AND assigned_site <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y%m'), assigned_site
) departure ON msc.month_key = departure.month_key AND msc.assigned_site = departure.assigned_site
LEFT JOIN (
    -- Number of active employees at the beginning of each month per assigned site
    SELECT
        month_key,
        assigned_site,
        COUNT(DISTINCT employee_id) as active_num,
        MAX(etl_time) as etl_time
    FROM (
        SELECT
            msc.month_key,
            msc.assigned_site,
            emp.employee_id,
            emp.start_date,
            emp.departure_date,
            emp.etl_time
        FROM month_site_combinations msc
        INNER JOIN `internal`.`dw`.`dw_fichier_operateur_enrolement` emp
            ON msc.assigned_site = emp.assigned_site
        WHERE emp.start_date IS NOT NULL
          AND emp.assigned_site IS NOT NULL
          AND emp.assigned_site <> ''
    ) emp_months
    WHERE
        start_date <= STR_TO_DATE(CONCAT(month_key, '01'), '%Y%m%d')
        AND (
            departure_date IS NULL
			OR departure_date='NULL'
            OR departure_date = ''
            OR departure_date > STR_TO_DATE(CONCAT(month_key, '01'), '%Y%m%d')
        )
    GROUP BY month_key, assigned_site
) active ON msc.month_key = active.month_key AND msc.assigned_site = active.assigned_site
WHERE COALESCE(active.active_num, departure.departure_num) IS NOT NULL
ORDER BY msc.month_key, msc.assigned_site;


-- This table calculates the annual turnover rate of operators by each on-site (annual departures divided by active employees at the beginning of the year per site).
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_yearly_by_site;
CREATE VIEW dm.`dm_operator_turnover_rate_yearly_by_site` COMMENT 'VIEW' AS
WITH all_years AS (
    SELECT DISTINCT DATE_FORMAT(year_date, '%Y') as year_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_year, INTERVAL t1 YEAR) as year_date
        FROM (
            SELECT
                DATE_FORMAT(MIN(start_date), '%Y-01-01') as first_day_of_first_year
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
            WHERE start_date IS NOT NULL
        ) first_year
        CROSS JOIN (SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
                    UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
                    UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14
                    UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19
                    UNION SELECT 20) t1
        WHERE DATE_ADD(
                first_day_of_first_year,
                INTERVAL t1 YEAR
            ) <= CURDATE()
    ) year_dates
),
all_sites AS (
    -- Get all distinct non-null assigned sites
    SELECT DISTINCT assigned_site
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE assigned_site IS NOT NULL AND assigned_site <> ''
),
year_site_combinations AS (
    SELECT
        ay.year_key,
        s.assigned_site
    FROM all_years ay
    CROSS JOIN all_sites s
)
SELECT
    ysc.assigned_site,  
    COALESCE(departure.departure_num, 0) as departure_num,  
    COALESCE(active.active_num, 0) as active_num,  
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / COALESCE(active.active_num, 0), 2)
    END as departure_rate,
    ysc.year_key as analysis_year,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM year_site_combinations ysc
LEFT JOIN (
    SELECT
        DATE_FORMAT(departure_date, '%Y') as year_key,
        assigned_site,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE departure_date IS NOT NULL
      AND departure_date <> ''
      AND assigned_site IS NOT NULL
      AND assigned_site <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y'), assigned_site
) departure ON ysc.year_key = departure.year_key AND ysc.assigned_site = departure.assigned_site
LEFT JOIN (
    -- Number of active employees at the beginning of each year (January 1st) per assigned site
    SELECT
        year_key,
        assigned_site,
        COUNT(DISTINCT employee_id) as active_num, 
        MAX(etl_time) as etl_time
    FROM (
        SELECT
            ysc.year_key,
            ysc.assigned_site,
            emp.employee_id,
            emp.start_date,
            emp.departure_date,
            emp.etl_time
        FROM year_site_combinations ysc
        INNER JOIN `internal`.`dw`.`dw_fichier_operateur_enrolement` emp
            ON ysc.assigned_site = emp.assigned_site
        WHERE emp.start_date IS NOT NULL
          AND emp.assigned_site IS NOT NULL
          AND emp.assigned_site <> ''
    ) emp_years
    WHERE
        start_date <= STR_TO_DATE(CONCAT(year_key, '0101'), '%Y%m%d')
        AND (
            departure_date IS NULL
            OR departure_date='NULL'
            OR departure_date = ''
            OR departure_date > STR_TO_DATE(CONCAT(year_key, '0101'), '%Y%m%d')
        )
    GROUP BY year_key, assigned_site
) active ON ysc.year_key = active.year_key AND ysc.assigned_site = active.assigned_site
WHERE COALESCE(active.active_num, departure.departure_num) IS NOT NULL
ORDER BY ysc.year_key, ysc.assigned_site;


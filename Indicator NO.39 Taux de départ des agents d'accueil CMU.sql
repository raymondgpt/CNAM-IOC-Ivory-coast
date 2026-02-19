/*Indicator NO.39 Taux de départ des agents d'accueil CMU*/
-- ODS LAYER
-- This table stores detailed enrollment, departure and replacement info of CMU reception agents at health centers.DROP TABLE IF EXISTS ods.ods_fichiers_sources_excel_depart_agent_accueil;
CREATE TABLE ods.ods_fichiers_sources_excel_depart_agent_accueil (
  `observation_number` VARCHAR(255) NULL,
  `first_and_last_name` VARCHAR(255) NULL,
  `employee_id` VARCHAR(255) NULL,
  `function_job_title` VARCHAR(255) NULL,
  `department_division` VARCHAR(255) NULL,
  `region` VARCHAR(255) NULL,
  `department` VARCHAR(255) NULL,
  `location` VARCHAR(255) NULL,
  `service` VARCHAR(255) NULL,
  `assigned_health_center` VARCHAR(255) NULL,
  `start_date_of_employment` VARCHAR(255) NULL,
  `departure_date` VARCHAR(255) NULL,
  `type_of_departure` VARCHAR(255) NULL,
  `reason_for_departure` VARCHAR(255) NULL,
  `notice_respected_yes_no` VARCHAR(255) NULL,
  `replacement_identified_yes_no` VARCHAR(255) NULL,
  `first_and_last_name_of_the_replacement` VARCHAR(255) NULL,
  `handover_transition_date` VARCHAR(255) NULL,
  `comments_observations` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`observation_number`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`observation_number`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- DW LAYER
-- This table stores detailed enrollment, departure and replacement info of CMU reception agents at health centers.
DROP VIEW IF EXISTS dw.dw_depart_agent_accueil;
CREATE VIEW dw.dw_depart_agent_accueil COMMENT 'VIEW' AS
select
    observation_number,
    first_and_last_name,
    employee_id,
    function_job_title,
    department_division,
    region,
    department,
    location,
    service,
    assigned_health_center,
    start_date_of_employment,
    departure_date,
    type_of_departure,
    reason_for_departure,
    notice_respected_yes_no,
    replacement_identified_yes_no,
    first_and_last_name_of_the_replacement,
    handover_transition_date,
    comments_observations,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_depart_agent_accueil`;


-- DM LAYER
-- This table calculates the monthly turnover rate of CMU health center reception staff (departures divided by active employees at the beginning of the month).
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_monthly`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_monthly` COMMENT 'VIEW' AS
WITH all_months AS (
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month,INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            SELECT
                DATE_FORMAT(MIN(start_date_of_employment), '%Y-%m-01') as first_day_of_first_month
            FROM `internal`.`dw`.`dw_depart_agent_accueil`
            WHERE start_date_of_employment IS NOT NULL
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
    -- Monthly number of departing employees
    SELECT
        DATE_FORMAT(departure_date, '%Y%m') as month_key,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE departure_date IS NOT NULL AND departure_date <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y%m')
) departure ON all_months.month_key = departure.month_key
LEFT JOIN (
    -- Number of active employees at the beginning of each month
    SELECT
        am.month_key,
        COUNT(DISTINCT emp.employee_id) as active_num
    FROM all_months am
    LEFT JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
        ON emp.start_date_of_employment IS NOT NULL
        -- Employee was hired before the first day of the month
        AND emp.start_date_of_employment <= STR_TO_DATE(CONCAT(am.month_key, '01'), '%Y%m%d')
        -- Employee left after the first day of the month or has not left yet
        AND (
            emp.departure_date IS NULL
            OR emp.departure_date = ''
            OR emp.departure_date > STR_TO_DATE(CONCAT(am.month_key, '01'), '%Y%m%d')
        )
    GROUP BY am.month_key
) active ON all_months.month_key = active.month_key
WHERE active_num IS NOT NULL
ORDER BY all_months.month_key;


-- This table calculates the annual turnover rate of CMU health center reception staff (annual departures divided by active employees at the beginning of the year).
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_yearly`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_yearly` COMMENT 'VIEW' AS
WITH all_years AS (
    SELECT DISTINCT year_key
    FROM (
        SELECT
            DATE_FORMAT(DATE_ADD(first_year_start, INTERVAL t1 YEAR), '%Y') as year_key
        FROM (
            SELECT
                COALESCE(DATE_FORMAT(MIN(start_date_of_employment), '%Y-01-01'), CURDATE()) as first_year_start
            FROM `internal`.`dw`.`dw_depart_agent_accueil`
            WHERE start_date_of_employment IS NOT NULL
        ) first_year
        CROSS JOIN (
            SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
            UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
            UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14
            UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19
            UNION SELECT 20 UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24
            UNION SELECT 25 UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29
            UNION SELECT 30
        ) t1
        WHERE DATE_ADD(first_year_start, INTERVAL t1 YEAR) <= CURDATE()
    ) year_dates
)
SELECT
    y.year_key as analysis_year,
    COALESCE(departure.departure_num, 0) as departure_num,      
    COALESCE(active.active_num, 0) as active_num,       
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0.00
        ELSE ROUND(COALESCE(departure.departure_num, 0) / active.active_num, 2)
    END as departure_rate,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP()) as etl_time
FROM all_years y
LEFT JOIN (
    -- Annual number of departing employees
    SELECT
        YEAR(departure_date) as year_key,
        COUNT(DISTINCT employee_id) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE departure_date IS NOT NULL
      AND departure_date <> ''
      AND departure_date >= STR_TO_DATE(CONCAT(YEAR(departure_date), '-01-01'), '%Y-%m-%d')
      AND departure_date <= STR_TO_DATE(CONCAT(YEAR(departure_date), '-12-31'), '%Y-%m-%d')
      AND start_date_of_employment IS NOT NULL
    GROUP BY YEAR(departure_date)
) departure ON y.year_key = departure.year_key
LEFT JOIN (
    -- Number of active employees at the beginning of each year (January 1st)
    SELECT
        y_inner.year_key,
        COUNT(DISTINCT emp.employee_id) as active_num,
        MAX(emp.etl_time) as etl_time
    FROM all_years y_inner
    CROSS JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
    WHERE emp.start_date_of_employment IS NOT NULL
      -- Employee was hired before January 1st of the year
      AND emp.start_date_of_employment <= STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      -- Employee left after January 1st of the year or has not left yet
      AND (
          emp.departure_date IS NULL
          OR emp.departure_date = ''
          OR emp.departure_date > STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      )
    GROUP BY y_inner.year_key
) active ON y.year_key = active.year_key
ORDER BY y.year_key ASC;


-- This table calculates the monthly turnover rate of CMU reception staff by each health center (departures divided by active employees at the beginning of the month per center).
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_monthly_by_health_center`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_monthly_by_health_center` COMMENT 'VIEW' AS
WITH all_months AS (
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key,
           DATE_FORMAT(month_date, '%Y-%m-01') as month_first_day
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month, INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            SELECT
                DATE_FORMAT(MIN(start_date_of_employment), '%Y-%m-01') as first_day_of_first_month
            FROM `internal`.`dw`.`dw_depart_agent_accueil`
            WHERE start_date_of_employment IS NOT NULL
        ) first_month
        CROSS JOIN (SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1
        CROSS JOIN (SELECT 0 as t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
        WHERE DATE_ADD(first_day_of_first_month, INTERVAL (t2*10 + t1) MONTH) <= CURDATE()
    ) month_dates
),
all_health_centers AS (
    SELECT DISTINCT assigned_health_center
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE assigned_health_center IS NOT NULL
      AND TRIM(assigned_health_center) <> ''
),
month_center_combinations AS (
    SELECT
        am.month_key,
        am.month_first_day,
        hc.assigned_health_center
    FROM all_months am
    CROSS JOIN all_health_centers hc
)
SELECT
    mcc.assigned_health_center as health_center_name,
    COALESCE(departure.departure_num, 0) as departure_num,
    COALESCE(active.active_num, 0) as active_num,
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / active.active_num, 2)
    END as departure_rate,
    mcc.month_key as analysis_month,
	year(STR_TO_DATE(mcc.month_key,'%Y%m')) as year,
    DATE_FORMAT(STR_TO_DATE(mcc.month_key,'%Y%m'), '%b-%Y') as month,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM month_center_combinations mcc
LEFT JOIN (
    -- Monthly number of departing employees per assigned health center
    SELECT
        DATE_FORMAT(departure_date, '%Y%m') as month_key,
        assigned_health_center,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE departure_date IS NOT NULL
      AND departure_date <> ''
      AND assigned_health_center IS NOT NULL
      AND TRIM(assigned_health_center) <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y%m'), assigned_health_center
) departure ON mcc.month_key = departure.month_key
            AND mcc.assigned_health_center = departure.assigned_health_center
LEFT JOIN (
    -- Number of active employees at the beginning of each month per assigned health center
    SELECT
        mcc.month_key,
        mcc.assigned_health_center,
        COUNT(DISTINCT emp.employee_id) as active_num,
        MAX(emp.etl_time) as etl_time
    FROM month_center_combinations mcc
    LEFT JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
        ON mcc.assigned_health_center = emp.assigned_health_center
        AND emp.start_date_of_employment IS NOT NULL
        -- Employee was hired before the first day of the month
        AND emp.start_date_of_employment <= mcc.month_first_day
        -- Employee left after the first day of the month or has not left yet
        AND (
            emp.departure_date IS NULL
            OR emp.departure_date = ''
            OR emp.departure_date >= mcc.month_first_day
        )
    GROUP BY mcc.month_key, mcc.assigned_health_center
) active ON mcc.month_key = active.month_key
         AND mcc.assigned_health_center = active.assigned_health_center
WHERE COALESCE(active.active_num, departure.departure_num, 0) > 0
ORDER BY mcc.month_key, mcc.assigned_health_center;


-- This table calculates the annual turnover rate of CMU reception staff by each health center (annual departures divided by active employees at the beginning of the year per center).
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_yearly_by_health_center`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_yearly_by_health_center`
COMMENT 'VIEW' AS
WITH all_years AS (
    SELECT DISTINCT year_key
    FROM (
        SELECT
            DATE_FORMAT(DATE_ADD(first_year_start, INTERVAL t1 YEAR), '%Y') as year_key
        FROM (
            SELECT
                COALESCE(DATE_FORMAT(MIN(start_date_of_employment), '%Y-01-01'), CURDATE()) as first_year_start
            FROM `internal`.`dw`.`dw_depart_agent_accueil`
            WHERE start_date_of_employment IS NOT NULL
        ) first_year
        CROSS JOIN (
            SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
            UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
            UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14
            UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19
            UNION SELECT 20 UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24
            UNION SELECT 25 UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29
            UNION SELECT 30
        ) t1
        WHERE DATE_ADD(first_year_start, INTERVAL t1 YEAR) <= CURDATE()
    ) year_dates
),
all_health_centers AS (
    SELECT DISTINCT TRIM(assigned_health_center) as assigned_health_center
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE assigned_health_center IS NOT NULL
      AND TRIM(assigned_health_center) <> ''
),
year_hc_combinations AS (
    SELECT
        ay.year_key,
        ahc.assigned_health_center
    FROM all_years ay
    CROSS JOIN all_health_centers ahc
)
SELECT
    yhc.assigned_health_center as health_center_name,
    COALESCE(departure.departure_num, 0) as departure_num,
    COALESCE(active.active_num, 0) as active_num,
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0.00
        ELSE ROUND(COALESCE(departure.departure_num, 0) / active.active_num, 2)
    END as departure_rate, 
    yhc.year_key as analysis_year,  
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP()) as etl_time
FROM year_hc_combinations yhc
LEFT JOIN (
    -- Annual number of departing employees per assigned health center
    SELECT
        YEAR(departure_date) as year_key,
        TRIM(assigned_health_center) as assigned_health_center,
        COUNT(DISTINCT employee_id) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE departure_date IS NOT NULL
      AND departure_date <> ''
      AND assigned_health_center IS NOT NULL
      AND TRIM(assigned_health_center) <> ''
      AND start_date_of_employment IS NOT NULL
      AND departure_date >= STR_TO_DATE(CONCAT(YEAR(departure_date), '-01-01'), '%Y-%m-%d')
      AND departure_date <= STR_TO_DATE(CONCAT(YEAR(departure_date), '-12-31'), '%Y-%m-%d')
    GROUP BY YEAR(departure_date), TRIM(assigned_health_center)
) departure ON yhc.year_key = departure.year_key
            AND yhc.assigned_health_center = departure.assigned_health_center
LEFT JOIN (
    -- Number of active employees at the beginning of each year (January 1st) per assigned health center
    SELECT
        y_inner.year_key,
        TRIM(emp.assigned_health_center) as assigned_health_center,
        COUNT(DISTINCT emp.employee_id) as active_num,         MAX(emp.etl_time) as etl_time
    FROM all_years y_inner
    CROSS JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
    WHERE emp.assigned_health_center IS NOT NULL
      AND TRIM(emp.assigned_health_center) <> ''
      AND emp.start_date_of_employment IS NOT NULL
      -- Employee was hired before January 1st of the year
      AND emp.start_date_of_employment <= STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      -- Employee left after January 1st of the year or has not left yet
      AND (
          emp.departure_date IS NULL
          OR emp.departure_date = ''
          OR emp.departure_date > STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      )
    GROUP BY y_inner.year_key, TRIM(emp.assigned_health_center)
) active ON yhc.year_key = active.year_key
         AND yhc.assigned_health_center = active.assigned_health_center
WHERE COALESCE(active.active_num, departure.departure_num, 0) > 0
ORDER BY yhc.year_key ASC, yhc.assigned_health_center ASC;

/*Indicator NO.12 Nombre de sites d'enrolement*/
-- ODS LAYER
-- This table records the number of card registrations for each site.
drop TABLE `ods`.`ods_fichiers_sources_excel_site_enrolement`;
CREATE TABLE `ods`.`ods_fichiers_sources_excel_site_enrolement` (
                                                                    `region` VARCHAR(255) NULL,
                                                                    `department` VARCHAR(255) NULL,
                                                                    `site_name` VARCHAR(255) NULL,
                                                                    `type` VARCHAR(255) NULL,
                                                                    `open_date` DATE NULL,
                                                                    `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
    DUPLICATE KEY(`region`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`region`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

-- DW LAYER
-- dw.dw_site_enrolement source(record the number of card registrations for each site)
DROP VIEW `dw`.`dw_site_enrollment`;
CREATE
    VIEW `dw`.`dw_site_enrollment` AS
select
    region,
    department,
    site_name,
    type,
    open_date,
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_site_enrolement`;


-- DM LAYER
-- This table stores the count of enrollment sites by region.
DROP VIEW IF EXISTS dm.dm_enrollment_sites_number_by_region;
CREATE
    VIEW dm.dm_enrollment_sites_number_by_region  AS
select
    A.region,
    B.geo_name,
    A.site_num,
    A.etl_time
from
    (
        select
            region,
            count(1) as site_num,
            max(etl_time) as etl_time
        from
            `dw`.`dw_site_enrollment`
        group by
            region) A
        left join `dim`.`dim_country_district` B on
        A.region = B.name;

-- This table stores the quantity statistics of enrollment sites by year
DROP VIEW IF EXISTS dm.dm_enrollment_sites_number_by_year;
CREATE VIEW dm.dm_enrollment_sites_number_by_year AS
select
    count(1) as site_num,
    DATE_FORMAT(open_date,'%Y')  as open_year
from `dw`.`dw_site_enrollment`
group by DATE_FORMAT(open_date,'%Y');


-- This table stores the quantity statistics of enrollment sites by month
DROP VIEW IF EXISTS dm.dm_enrollment_sites_number_by_month;
CREATE VIEW dm.dm_enrollment_sites_number_by_month AS
select
    count(1) as site_num,
    DATE_FORMAT(open_date,'%Y%m') as open_month,
    DATE_FORMAT(open_date,'%b-%Y')  as eopen_month,
    DATE_FORMAT(open_date,'%Y') as year
from `dw`.`dw_site_enrollment`
group by DATE_FORMAT(open_date,'%Y%m'),DATE_FORMAT(open_date,'%b-%Y'),DATE_FORMAT(open_date,'%Y');



-- This table stores the quantity statistics of enrollment sites
DROP VIEW IF EXISTS dm.`dm_enrollment_sites`;
CREATE
    VIEW dm.`dm_enrollment_sites`  AS
select
    A.region,
    B.geo_name,
    A.site_name,
    A.type,
    A.site_num,
    DATE_FORMAT(A.open_date,'%Y')  as open_year,
    DATE_FORMAT(A.open_date,'%Y%m') as open_month,
    DATE_FORMAT(A.open_date,'%b-%Y')  as eopen_month,
    A.etl_time
from
    (
        select
            region,
            site_name,
            type,
            open_date,
            count(1) as site_num,
            max(etl_time) as etl_time
        from
            `dw`.`dw_site_enrollment`
        group by
            region,site_name,type,open_date) A
        left join `dim`.`dim_country_district` B on
        A.region = B.name;









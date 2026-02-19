/*Indicator NO.16 Nombre moyen de cartes produite par jour pour une imprimante*/
--ODS LAYER
--this table stores the card production(in situ) number of each site in each date
DROP TABLE IF EXISTS `ods_fichiers_sources_excel_production_declaratives`;
CREATE TABLE `ods_fichiers_sources_excel_production_declaratives` (
                                                                      `region` VARCHAR(255) NULL,
                                                                      `coordination` VARCHAR(255) NULL,
                                                                      `site` VARCHAR(255) NULL,
                                                                      `closing_date` DATE NULL,
                                                                      `total` DOUBLE NULL,
                                                                      `period` VARCHAR(255) NULL,
                                                                      `period_type` VARCHAR(255) NULL,
                                                                      `value` DOUBLE NULL,
                                                                      `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
    DUPLICATE KEY(`region`,`coordination`,`site`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`region`,`coordination`,`site`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);
--this table stores the card production(prod masse) number of each site in each date
DROP TABLE IF EXISTS `ods`.`ods_fichiers_sources_excel_production_declaratives_prodmasse`;
CREATE TABLE IF NOT EXISTS `ods`.`ods_fichiers_sources_excel_production_declaratives_prodmasse` (
                                                                                                    `region` VARCHAR(255) NULL,
                                                                                                    `coordination` VARCHAR(255) NULL,
                                                                                                    `site` VARCHAR(255) NULL,
                                                                                                    `total` DOUBLE NULL,
                                                                                                    `closing_date` DATE NULL,   -- Newly added 0126
                                                                                                    `period` VARCHAR(255) NULL,
                                                                                                    `period_type` VARCHAR(255) NULL,
                                                                                                    `value` DOUBLE NULL,
                                                                                                    `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
    DUPLICATE KEY(`region`, `coordination`, `site`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`region`, `coordination`, `site`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

--DW LAYER
--this table stores the card production(in situ) number of each site in each date
DROP VIEW dw.`dw_production_declaratives`;
CREATE
    VIEW dw.`dw_production_declaratives`  AS
select
    region,
    UPPER(coordination) as coordination,
    site,
    closing_date,   -- Newly added 0126
    total,
    period,
    'In Situ' as production_type,  -- Newly added
    period_type,
    value,
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_production_declaratives`
where
    value is not null;

--this table stores the card production(prod masse) number of each site in each date
drop view if exists `dw`.`dw_production_declaratives_prodmasse`;
create view `dw`.`dw_production_declaratives_prodmasse`
as
select region,
       UPPER(coordination) as coordination,
       site,
       total,
       closing_date,   -- Newly added 0126
       period,
       'Production de masse' as production_type,
       period_type,
       value,
       etl_time
from `ods`.`ods_fichiers_sources_excel_production_declaratives_prodmasse`
where value is not null ;

--this table records all of the card production number(in situ)
drop view if exists  dw.`dw_production_declaratives_all_data`;
CREATE
    VIEW dw.`dw_production_declaratives_all_data`  AS
select
    region,
    UPPER(coordination) as coordination,
    site,
    closing_date,
    total,
    period,
    'in suite' as production_type,
    period_type,
    value,
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_production_declaratives`;

--this table records all of the card production number(in situ)
drop view if exists  dw.`dw_production_declaratives_all_data`;
CREATE
    VIEW dw.`dw_production_declaratives_all_data`  AS
select
    region,
    UPPER(coordination) as coordination,
    site,
    closing_date,
    total,
    period,
    'in suite' as production_type,
    period_type,
    value,
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_production_declaratives`;

--DM LAYER
--this table union the card production(in situ)&card production(prod masse)&total number(tous)of each site in each date
drop view if exists dm.dm_production_declaratives_in_situ_and_prodmass;
create view dm.dm_production_declaratives_in_situ_and_prodmass as
select
    nvl(b.geo_name,info.region) as region,
    coordination,
    site,
    closing_date,
    period,
    DATE_FORMAT(period,'%d-%b-%Y') as eperiod,
    production_type,
    value
from
(select
    region,
    coordination,
    site,
    closing_date,
    period,
    production_type,
    value
from dw.dw_production_declaratives_in_situ_and_prodmass
union all
select
    region,
    coordination,
    site,
    closing_date,
    period,
    'Tous' as production_type,
    sum(value)
from dw.dw_production_declaratives_in_situ_and_prodmass a
group by region,coordination,site,closing_date,period) info
left join dim.dim_country_district b on info.region=b.name
order by site,period;


-- This table records the in-situ&prodmass card production and the stock
create view dm.dm_production_declaratives_in_situ_and_prodmass_stock COMMENT 'VIEW' AS(
select
    a.*,b.stock
from dm.dm_production_declaratives_in_situ_and_prodmass a
left join
    dm.dm_available_inventory_cards_siege_and_region b
on a.site =b.site_name);


----this table records the card production number of site(in situ&prod masse)
drop view if exists dm.dm_production_declaratives_in_situ_and_prodmass_only_site
create view dm.dm_production_declaratives_in_situ_and_prodmass_only_site as
select
    b.geo_name as region,
    coordination,
    site,
    closing_date,
    period,
    DATE_FORMAT(period,'%d-%b-%Y') as eperiod,
    production_type,
    value
from
    (select
         region,
         coordination,
         site,
         closing_date,
         period,
         production_type,
         value
     from dw.dw_production_declaratives_in_situ_and_prodmass_all_data
     where region!='ITINERANCE' and region!=''
     union all
     select
         region,
         coordination,
         site,
         closing_date,
         period,
         'tous' as production_type,
         sum(value)
     from dw.dw_production_declaratives_in_situ_and_prodmass_all_data a
     where region!='ITINERANCE' and region!=''
     group by region,coordination,site,closing_date,period) info
        left join dim.dim_country_district b on info.region=b.name
order by site,period;

----this table records the card production number of camion(in situ&prod masse)
drop view if exists dm.dm_production_declaratives_in_situ_and_prodmass_only_camion;
create view dm.dm_production_declaratives_in_situ_and_prodmass_only_camion as
select
    region,
    coordination,
    site,
    closing_date,
    period,
    DATE_FORMAT(period,'%d-%b-%Y') as eperiod,
    production_type,
    value
from
    (select
         region,
         coordination,
         site,
         closing_date,
         period,
         production_type,
         value
     from dw.dw_production_declaratives_in_situ_and_prodmass_all_data
     where region='ITINERANCE'
     union all
     select
         region,
         coordination,
         site,
         closing_date,
         period,
         'tous' as production_type,
         sum(value)
     from dw.dw_production_declaratives_in_situ_and_prodmass_all_data a
     where region='ITINERANCE'
     group by region,coordination,site,closing_date,period) info
order by site,period;


-- This tables records the number of card production per day
create VIEW dm.`dm_average_card_production_per_day`  AS(
WITH t1 AS (
    SELECT SUM(value) as total_sum
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_stock
    WHERE production_type = 'Tous'
),
t2 AS (
    SELECT COUNT(DISTINCT period) as period_count
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_stock
)
SELECT
    ROUND(t1.total_sum / t2.period_count, 0) as average_value
FROM t1
CROSS JOIN t2);

-- this table records the count of site,active site,camion and active camion
create view dm.dm_site_camion_count as(
WITH
total_site AS (
    SELECT COUNT(DISTINCT site) AS total_site_count
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_only_site
),
active_site AS (
    SELECT COUNT(DISTINCT site) AS active_site_count
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_only_site
    WHERE closing_date IS NULL
),
total_camion AS (
    SELECT COUNT(DISTINCT site) AS total_camion_count
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_only_camion
),
active_camion AS (
    SELECT COUNT(DISTINCT site) AS active_camion_count
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_only_camion
    WHERE closing_date IS NULL
)
SELECT
    total_site_count,
    active_site_count,
    total_camion_count,
    active_camion_count
FROM total_site, active_site, total_camion, active_camion);

/*Indicator NO.45 Nombre de centres de santé conventionnées&*NO.46 Taux de couverture du réseau de soins CMU (centre de santé)*/
---ODS LAYER
CREATE TABLE `ods_fichiers_sources_excel_liste_centres_sante_conventionnes` (
  `health_region` VARCHAR(255) NULL,
  `health_district` VARCHAR(255) NULL,
  `departmental_direction` VARCHAR(255) NULL,
  `sub_prefecture` VARCHAR(255) NULL,
  `location` VARCHAR(255) NULL,
  `cnam_establishment_code` VARCHAR(255) NULL,
  `business_name` VARCHAR(255) NULL,
  `center_type` VARCHAR(255) NULL,
  `pyramid_level` INT NULL,
  `contract_date` DATE NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`health_region`, `health_district`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`health_region`, `health_district`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

CREATE TABLE `ods_fichiers_sources_excel_liste_centres_sante` (
  `sanitary_region` VARCHAR(255) NULL,
  `sanitary_district` VARCHAR(255) NULL,
  `locality` VARCHAR(255) NULL,
  `business_name` VARCHAR(255) NULL,
  `center_type` VARCHAR(255) NULL,
  `category` VARCHAR(255) NULL,
  `pyramid_level` BIGINT NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`sanitary_region`, `sanitary_district`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sanitary_region`, `sanitary_district`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

-- DW LAYER
CREATE OR REPLACE
VIEW `dw_liste_centres_sante_conventionnes` COMMENT 'VIEW' AS
select
    health_region,
    health_district,
    departmental_direction,
    sub_prefecture,
    location,
    cnam_establishment_code,
    business_name,
    center_type,
    pyramid_level,
    contract_date,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_liste_centres_sante_conventionnes`;

CREATE OR REPLACE
VIEW `dw_liste_centres_sante` COMMENT 'VIEW' AS
select
    sanitary_region,
    sanitary_district,
    locality,
    business_name,
    center_type,
    category,
    pyramid_level,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_liste_centres_sante`;

-- DM LAYER
-- this table defines the coverage rate of the contracted health center
CREATE VIEW `dm`.`dm_contracted_health_center_coverage_rate_by_region` COMMENT 'VIEW' AS
select
	AA.geo_name,
	AA.center_type,
	AA.pyramid_level,
	AA.health_centers_number,
	BB.sanitary_number,
	BB.sanitary_number / AA.health_centers_number as coverage_rate
from
(select
	B.geo_name,
	A.center_type,
	A.pyramid_level,
	count(1) as health_centers_number
from `dw`.`dw_liste_centres_sante_conventionnes` A
left join `dim`.`dim_country_district` B
on A.health_region = B.name
group by
	B.geo_name,
	A.center_type,
	A.pyramid_level)AA
left join
(select
	B.geo_name,
	A.center_type,
	A.pyramid_level,
	count(1) as sanitary_number
from `dw`.`dw_liste_centres_sante` A
left join `dim`.`dim_country_district` B
on A.sanitary_region = B.name
group by
	B.geo_name,
	A.center_type,
	A.pyramid_level)BB
on AA.geo_name = BB.geo_name
and AA.center_type = BB.center_type
and AA.pyramid_level = BB.pyramid_level;

/*Indicater 47 Nombre de pharmacies conventionnées&Indicater 48 Taux de couverture du réseau des pharmacies*/
-- ODS LAYER
CREATE TABLE `ods_fichiers_sources_excel_liste_pharmacie_conventionnes` (
  `sanitary_region` VARCHAR(255) NULL,
  `sanitary_district` VARCHAR(255) NULL,
  `departmental_direction` VARCHAR(255) NULL,
  `sub_prefecture` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `office_code` VARCHAR(255) NULL,
  `business_name` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`sanitary_region`, `sanitary_district`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sanitary_region`, `sanitary_district`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

CREATE TABLE `ods_fichiers_sources_excel_liste_pharmacie` (
  `regions` VARCHAR(255) NULL,
  `department` VARCHAR(255) NULL,
  `locality` DOUBLE NULL,
  `establishment_name` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`regions`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`regions`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

--DW LAYER
CREATE OR REPLACE
VIEW `dw_liste_pharmacie_conventionnes` COMMENT 'VIEW' AS
select
    sanitary_region,
    sanitary_district,
    departmental_direction,
    sub_prefecture,
    city,
    office_code,
    business_name,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_liste_pharmacie_conventionnes`;

CREATE OR REPLACE
VIEW `dw_liste_pharmacie` COMMENT 'VIEW' AS
select
    regions,
    department,
    locality,
    establishment_name,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_liste_pharmacie`;

-- DM LAYER
-- this table defines the coverage rate of the contracted pharmacies
drop view `dm`.`dm_bm_pharmacy_network_coverage_rate_region`;
CREATE VIEW `dm`.`dm_contracted_pharmacy_coverage_rate_by_region` COMMENT 'VIEW' AS
select
    A.geo_name,
    B.sanitary_number,
    A.pharmacie_number,
    B.sanitary_number / A.pharmacie_number as coverage_rate
from
    (select geo_name, sum(pharmacie_number) as pharmacie_number from `internal`.`dm`.`dm_bm_number_pharmacie_region` group by geo_name) A
left join (
    select
        geo_name,
        sum(sanitary_number) as sanitary_number
    from
        `internal`.`dm`.`dm_bm_number_contracted_pharmacies_region`
    group by
        geo_name) B
on
    A.geo_name = B.geo_name;

-- this table defines the contracted and total count of pharmacy and health center and their coverage rate
CREATE VIEW `dm`.`dm_health_center_and_pharmacy_coverage_rate` COMMENT 'VIEW' AS
SELECT
    health_centers.contracted_health_center_cnt,
    health_centers.total_health_center_cnt,
    health_centers.contracted_health_center_coverage_rate,
    pharmacies.contracted_pharmacy_cnt,
    pharmacies.total_pharmacy_cnt,
    pharmacies.contracted_pharmacy_coverage_rate
FROM
    (SELECT
        SUM(health_centers_number) AS contracted_health_center_cnt,
        SUM(sanitary_number) AS total_health_center_cnt,
        SUM(health_centers_number) / SUM(sanitary_number) AS contracted_health_center_coverage_rate
     FROM dm.dm_contracted_health_center_coverage_rate_by_region
    ) AS health_centers
CROSS JOIN
    (SELECT
        SUM(sanitary_number) AS contracted_pharmacy_cnt,
        SUM(pharmacie_number) AS total_pharmacy_cnt,
        SUM(sanitary_number) / SUM(pharmacie_number) AS contracted_pharmacy_coverage_rate
     FROM dm.dm_contracted_pharmacy_coverage_rate_by_region
    ) AS pharmacies;

/*Indicator NO.75 Nombre de campagnes de communication réalisées*/
---ODS LAYER
CREATE TABLE `ods_fichiers_sources_excel_campagne_communication` (
  `year` BIGINT NULL,
  `month` BIGINT NULL,
  `campaign_name` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`year`, `month`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`year`, `month`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);
---DW LAYER
CREATE OR REPLACE
VIEW `dw_campagne_communication` COMMENT 'VIEW' AS
select
    year as campagne_year,
    case
        when month < 10 then concat('0', month)
        else month
    end as campagne_month,
    campaign_name,
    status,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_campagne_communication`;
---DM LAYER
??????

/*Indicator NO.76 Taux de notoriété de la CNAM*/
---ODS LAYER
CREATE TABLE `ods_fichiers_sources_excel_notoriete_cnam` (
  `year` BIGINT NULL,
  `rate` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`year`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`year`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

-- DW LAYER
CREATE OR REPLACE
VIEW `dw_notoriete_cnam` COMMENT 'VIEW' AS
select
    year as notoriete_year,
    case
         when right(rate,1) = '%' then SUBSTRING_INDEX('93.7%', '%', 1)/100
    else rate end as rate,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_notoriete_cnam`;

-- DM LAYER
CREATE OR REPLACE
VIEW `dm_ccm_cnam_awareness_rate_yearly` COMMENT 'VIEW' AS
select
    notoriete_year,
    cast(rate as double) as rate,
    etl_time
from
    `internal`.`dw`.`dw_notoriete_cnam`;

/*Indicator NO.77 Nombre de visteurs sur le site web*/
---ODS LAYER
CREATE TABLE `ods_fichiers_sources_excel_visite_site_web` (
  `date` DATE NULL,
  `number_of_visitors` BIGINT NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`date`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`date`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

-- DW LAYER
CREATE OR REPLACE
VIEW `dw_visite_site_web` COMMENT 'VIEW' AS
select
    date as visite_date,
    number_of_visitors,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_visite_site_web`;

-- DM LAYER
????
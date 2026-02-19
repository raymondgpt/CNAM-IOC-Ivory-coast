# update 20260123
TRUNCATE TABLE dim.dim_country_district;
-- region mapping
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
('ABIDJAN 1','Abidjan','region',CURRENT_TIMESTAMP()),
('ABIDJAN 2','Abidjan','region',CURRENT_TIMESTAMP()),
('DISTRICT D''ABIDJAN','Abidjan','region',CURRENT_TIMESTAMP()),
('ABIDJAN','Abidjan','region',CURRENT_TIMESTAMP()),
('AGNEBY TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('REGION DE L AGNEBY-TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('AGNEBY-TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('REGION DE LAGNEBY-TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('LAGNEBY-TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('LAGNEBY-TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('LAGNEBY-TIASSA','Agnéby-tiassa','region',CURRENT_TIMESTAMP()),
('BAFING','Bafing','region',CURRENT_TIMESTAMP()),
('REGION DU BAFING','Bafing','region',CURRENT_TIMESTAMP()),
('BAGOUE','Bagoué','region',CURRENT_TIMESTAMP()),
('LA BAGOUE','Bagoué','region',CURRENT_TIMESTAMP()),
('LA BAGOUE','Bagoué','region',CURRENT_TIMESTAMP()),
('REGION DE LA BAGOUE','Bagoué','region',CURRENT_TIMESTAMP()),
('DISTRICT DE YAMOUSSOUKRO','Bélier','region',CURRENT_TIMESTAMP()),
('YAMOUSSOUKRO','Bélier','region',CURRENT_TIMESTAMP()),
('BELIER','Bélier','region',CURRENT_TIMESTAMP()),
('REGION DU BELIER','Bélier','region',CURRENT_TIMESTAMP()),
('BERE','Béré','region',CURRENT_TIMESTAMP()),
('REGION DU BERE','Béré','region',CURRENT_TIMESTAMP()),
('BOUNKANI','Bounkani','region',CURRENT_TIMESTAMP()),
('REGION DU BOUNKANI','Bounkani','region',CURRENT_TIMESTAMP()),
('CAVALLY','Cavally','region',CURRENT_TIMESTAMP()),
('REGION DU CAVALLY','Cavally','region',CURRENT_TIMESTAMP()),
('REGION DU FOLON','Folon','region',CURRENT_TIMESTAMP()),
('FOLON','Folon','region',CURRENT_TIMESTAMP()),
('REGION DE GBEKE','Gbeke','region',CURRENT_TIMESTAMP()),
('GBEKE','Gbeke','region',CURRENT_TIMESTAMP()),
('GBOKLE','Gbokle','region',CURRENT_TIMESTAMP()),
('REGION DU GBOKLE','Gbokle','region',CURRENT_TIMESTAMP()),
('GOH','Gôh','region',CURRENT_TIMESTAMP()),
('REGION DU GOH','Gôh','region',CURRENT_TIMESTAMP()),
('REGION DU GONTOUGO','Gontougo','region',CURRENT_TIMESTAMP()),
('GONTOUGO','Gontougo','region',CURRENT_TIMESTAMP()),
('GRANDS PONTS','Grands ponts','region',CURRENT_TIMESTAMP()),
('REGION DES GRANDS PONTS','Grands ponts','region',CURRENT_TIMESTAMP()),
('GUEMON','Guémon','region',CURRENT_TIMESTAMP()),
('REGION DU GUEMON','Guémon','region',CURRENT_TIMESTAMP()),
('REGION DU HAMBOL','Hambol','region',CURRENT_TIMESTAMP()),
('HAMBOL','Hambol','region',CURRENT_TIMESTAMP()),
('HAUT SASSANDRA','Haut-sassandra','region',CURRENT_TIMESTAMP()),
('HAUT-SASSANDRA','Haut-sassandra','region',CURRENT_TIMESTAMP()),
('REGION DU HAUT-SASSANDRA','Haut-sassandra','region',CURRENT_TIMESTAMP()),
('LIFFOU','Iffou','region',CURRENT_TIMESTAMP()),
('REGION DE LIFFOU','Iffou','region',CURRENT_TIMESTAMP()),
('REGION DE LIFFOU  ','Iffou','region',CURRENT_TIMESTAMP()),
('IFFOU','Iffou','region',CURRENT_TIMESTAMP()),
('REGION DE L IFFOU  ','Iffou','region',CURRENT_TIMESTAMP()),
('LINDENIE-DJUABLIN','Indénié-djuablin','region',CURRENT_TIMESTAMP()),
('REGION DE LINDENIE-DJUABLIN','Indénié-djuablin','region',CURRENT_TIMESTAMP()),
('REGION DE L INDENIE-DJUABLIN','Indénié-djuablin','region',CURRENT_TIMESTAMP()),
('INDENIE DJUABLIN','Indénié-djuablin','region',CURRENT_TIMESTAMP()),
('INDENIE-DJUABLIN','Indénié-djuablin','region',CURRENT_TIMESTAMP()),
('KABADOUGOU','Kabadougou','region',CURRENT_TIMESTAMP()),
('REGION DU KABADOUGOU','Kabadougou','region',CURRENT_TIMESTAMP()),
('LA ME','La Mé','region',CURRENT_TIMESTAMP()),
('REGION DE LA ME','La Mé','region',CURRENT_TIMESTAMP()),
('REGION DU LOH-DJIBOUA','Loh-djiboua','region',CURRENT_TIMESTAMP()),
('LOH DJIBOUA','Loh-djiboua','region',CURRENT_TIMESTAMP()),
('LOH-DJIBOUA','Loh-djiboua','region',CURRENT_TIMESTAMP()),
('REGION DE LA MARAHOUE','Marahoué','region',CURRENT_TIMESTAMP()),
('LA MARAHOUE','Marahoué','region',CURRENT_TIMESTAMP()),
('MARAHOUE','Marahoué','region',CURRENT_TIMESTAMP()),
('MORONOU','Moronou','region',CURRENT_TIMESTAMP()),
('REGION DU MORONOU','Moronou','region',CURRENT_TIMESTAMP()),
('NAWA','Nawa','region',CURRENT_TIMESTAMP()),
('LA NAWA','Nawa','region',CURRENT_TIMESTAMP()),
('REGION DE LA NAWA','Nawa','region',CURRENT_TIMESTAMP()),
('NZI','N''zi','region',CURRENT_TIMESTAMP()),
('REGION DU NZI','N''zi','region',CURRENT_TIMESTAMP()),
('N''ZI','N''zi','region',CURRENT_TIMESTAMP()),
('REGION DU N ZI','N''zi','region',CURRENT_TIMESTAMP()),
('REGION DU PORO','Poro','region',CURRENT_TIMESTAMP()),
('PORO','Poro','region',CURRENT_TIMESTAMP()),
('REGION DE SAN PEDRO','San pédro','region',CURRENT_TIMESTAMP()),
('SAN PEDRO','San pédro','region',CURRENT_TIMESTAMP()),
('SAN-PEDRO','San pédro','region',CURRENT_TIMESTAMP()),
('REGION DU SUD-COMOE','Sud-comoé','region',CURRENT_TIMESTAMP()),
('SUD COMOE','Sud-comoé','region',CURRENT_TIMESTAMP()),
('SUD-COMOE','Sud-comoé','region',CURRENT_TIMESTAMP()),
('TCHOLOGO','Tchologo','region',CURRENT_TIMESTAMP()),
('REGION DU TCHOLOGO','Tchologo','region',CURRENT_TIMESTAMP()),
('TONKPI','Tonkpi','region',CURRENT_TIMESTAMP()),
('REGION DU TONKPI','Tonkpi','region',CURRENT_TIMESTAMP()),
('WORODOUGOU','Worodougou','region',CURRENT_TIMESTAMP()),
('REGION DU WORODOUGOU','Worodougou','region',CURRENT_TIMESTAMP());

-- add a new region mapping
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
('LAGUNES','Abidjan','region',CURRENT_TIMESTAMP());

-- Indicateur NO.12 : Nombre de sites d'enrolement
-- dw.dw_site_enrolement source(记录每个站点的卡注册数)
-- ods.ods_fichiers_sources_excel_site_enrolement definition
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

DROP VIEW `dw`.`dw_site_enrollment`;
CREATE
    VIEW `dw`.`dw_site_enrollment` AS
select
    region,
    department,
    site_name,
    type,
    open_date,  -- newly add
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_site_enrolement`;


-- This table stores the total number of enrollment sites.
DROP VIEW IF EXISTS `dm_em_enrollment_sites_number_global_value`;
CREATE
    VIEW `dm_enrollment_sites_total`  AS
select
    count(1) as total_site_num,
    max(etl_time) as etl_time
from
    `dw`.`dw_site_enrollment`
where
    site_name is not null
  and site_name <> '';

-- This table stores the count of enrollment sites by type.
DROP VIEW IF EXISTS `dm_em_enrollment_sites_number_management_center`;
CREATE
    VIEW `dm_enrollment_sites_number_by_type` AS
select
    type,
    count(1) as site_num,
    rank() over(order by count(1) desc) as ranking
from
    `dw`.`dw_site_enrollment`
where
    type is not null
  and type <> ''
group by
    type;

-- This table stores the count of enrollment sites by region.
DROP VIEW IF EXISTS `dm_em_enrollment_sites_number_region`;
CREATE
    VIEW `dm_enrollment_sites_number_by_region`  AS
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

-- NEW:This table stores the quantity statistics of enrollment sites by year
DROP VIEW IF EXISTS dm_enrollment_sites_number_by_year;
CREATE VIEW dm_enrollment_sites_number_by_year AS
select
    count(1) as site_num,
    DATE_FORMAT(open_date,'%Y')  as open_year
from `dw`.`dw_site_enrollment`
group by DATE_FORMAT(open_date,'%Y');

-- NEW:This table stores the quantity statistics of enrollment sites by month
DROP VIEW IF EXISTS dm_enrollment_sites_number_by_month;
CREATE VIEW dm_enrollment_sites_number_by_month AS
select
    count(1) as site_num,
    DATE_FORMAT(open_date,'%Y-%m') as open_month,
    DATE_FORMAT(open_date,'%b-%y')  as eopen_month
from `dw`.`dw_site_enrollment`
group by DATE_FORMAT(open_date,'%b-%y'),DATE_FORMAT(open_date,'%Y-%m');


-- Indicateur NO.24 : Stock de cartes vierge préimprimées disponibles
-- update 01.26
-- 上层脚本全部重新执行
DROP VIEW dw.`dw_cartes_sites`;
CREATE
    VIEW dw.`dw_cartes_sites`  AS
select
    region,
    UPPER(department) AS department,
    UPPER(site_name) as site_name,
    type as site_type,
    number_of_cards_in_stock,
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_cartes_sites`;

-- This table stores the quantity of preprinted blank cards by region.
DROP VIEW IF EXISTS `dm_cpm_available_inventory_preprinted_blank_cards_region`;
CREATE
    VIEW `dm_available_blank_cards_by_region`  AS
select
    A.region,
    B.geo_name,
    A.number_of_cards_in_stock,
    A.etl_time
from
    (
        select
            region,
            sum(number_of_cards_in_stock) as number_of_cards_in_stock,
            max(etl_time)as etl_time
        from
            `dw`.`dw_cartes_sites`
        group by
            region)A
        left join `dim`.`dim_country_district` B on
        A.region = B.name;



-- This table stores the total quantity of preprinted blank cards.
DROP VIEW IF EXISTS dm_cpm_available_inventory_preprinted_blank_cards_global_value;
CREATE
    VIEW `dm_available_inventory_cards_total`  AS
select
    sum(number_of_cards_in_stock) as total_number_of_cards_in_stock,
    max(etl_time)as etl_time
from
    `dw`.`dw_cartes_sites`;

-- update 01.26
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


-- update 01.26
-- dw.dw_production_declaratives source
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
    'in suite' as production_type,  -- Newly added
    period_type,
    value,
    etl_time
from
    `ods`.`ods_fichiers_sources_excel_production_declaratives`
where
    value is not null;


-- update 01.26
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

-- update 01.26
-- dw.dw_production_declaratives_prodmasse source
drop view if exists `dw`.`dw_production_declaratives_prodmasse`;
create view `dw`.`dw_production_declaratives_prodmasse`
as
select region,
       UPPER(coordination) as coordination,
       site,
       total,
       closing_date,   -- Newly added 0126
       period,
       'prod_masse' as production_type,
       period_type,
       value,
       etl_time
from `ods`.`ods_fichiers_sources_excel_production_declaratives_prodmasse`
where value is not null ;

# select * from `dw`.`dw_production_declaratives_prodmasse` where period='2024-07-25';
--  select * from `dw`.`dw_production_declaratives` where site ='COCODY BANQUE MONDIALE'
--  select count(distinct site) from ods.ods_fichiers_sources_excel_production_declaratives
-- select count(distinct site) from ods.ods_fichiers_sources_excel_production_declaratives_prodmasse

-- update 01.26
-- newly table : dw.dw_production_declaratives_in_situ_and_prodmass
drop view if exists `dw`.`dw_production_declaratives_in_situ_and_prodmass`;
create view `dw`.`dw_production_declaratives_in_situ_and_prodmass` as
select
    region,
    coordination,
    site,
    total,
    closing_date,  -- Newly added 0126
    period,
    production_type,
    sum(value) as value
from
(select
    region,
    coordination,
    site,
    total,
    closing_date,   -- Newly added 0126
    period,
    production_type,
    value
from
    dw.`dw_production_declaratives`
where
    value is not null
union all
select region,
       coordination,
       site,
       total,
       closing_date,  -- Newly added 0126
       period,
       production_type,
       value
from `dw`.`dw_production_declaratives_prodmasse`
where value is not null) dp
-- left join dim.dim_country_district a on dp.region=a.name
-- where closing_date is not null
group by region,coordination,site,total,closing_date,period,production_type;


-- update 01.26
-- newly add table:Site statistics for in_situ and prodmass states
drop view if exists dm.dm_production_declaratives_in_situ_and_prodmass;
create view dm.dm_production_declaratives_in_situ_and_prodmass as
select
    nvl(b.geo_name,info.region) as region,
    coordination,
    site,
    closing_date,   -- Newly added 0126
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
    'tous' as production_type,
    sum(value)
from dw.dw_production_declaratives_in_situ_and_prodmass a
group by region,coordination,site,closing_date,period) info
left join dim.dim_country_district b on info.region=b.name
order by site,period;

# select * from dm.dm_production_declaratives_in_situ_and_prodmass where closing_date is not null;

# select * from dm.dm_production_declaratives_in_situ_and_prodmass where period='2024-07-25';
# select * from dm.dm_production_declaratives_in_situ_and_prodmass where region is null;
#正确排序查询
/*SELECT
    region,
    coordination,
    site,
    period,
    production_type,
    value
FROM `dm`.`dm_production_declaratives_in_situ_and_prodmass` where period ='2025-08-16'
ORDER BY period, region, coordination, site, production_type;*/

-- newly add table:dw.`dw_cartes_siege`
drop view if exists dw.`dw_cartes_siege`;
CREATE VIEW  dw.`dw_cartes_siege` AS
SELECT
        status,
        delivery_date,
        number_of_crates,
        number_of_lattes_per_crate,
        total_lattes,
        number_of_cards_per_latte,
        total_cards,
        destination,
        etl_time
FROM ods.`ods_fichiers_sources_excel_cartes_siege`;


-- newly add table:This table records the number of inventory cards at headquarters and the number of blank cards available in each region.
drop view if exists dm.dm_available_inventory_cards_siege_and_region;
create view dm.dm_available_inventory_cards_siege_and_region as
select
    region,
    site_name,  -- upper
    stock
from
(SELECT 'Abidjan' as region
       ,'Siege' as site_name,
    SUM(
            CASE
                WHEN status = 'Entrée' THEN total_cards
                WHEN status = 'Sortie' THEN -total_cards
                ELSE 0
                END
    ) AS stock
FROM dw.`dw_cartes_siege`
union
select
    b.geo_name,
    site_name,
    number_of_cards_in_stock
from
    `dw`.`dw_cartes_sites` a
left join dim.dim_country_district b on a.region=b.name) site
order by (case when region='Abidjan' then 1 else 2 end);


# SELECT * FROM dm.dm_available_inventory_cards_siege_and_region WHERE site_name='COCODY BANQUE MONDIALE'

-- This table records the in-situ&prodmass card production and the stock
# 加 closing_date
create view dm.dm_production_declaratives_in_situ_and_prodmass_stock COMMENT 'VIEW' AS(
select a.*,b.stock  from dm.dm_production_declaratives_in_situ_and_prodmass a
left join dm.dm_available_inventory_cards_siege_and_region b
on a.site =b.site_name);
 select* from dm.dm_production_declaratives_in_situ_and_prodmass_stock where closing_date is not null;

/*SELECT
    region,
    coordination,
    site,
    period,
    closing_date,
    production_type,
    value,
    stock
FROM `dm`.`dm_production_declaratives_in_situ_and_prodmass_stock`
ORDER BY period, region, coordination, site, production_type;*/


-- SELECT
--     count(distinct site)
-- FROM `dm`.`dm_production_declaratives_in_situ_and_prodmass`
--
-- SELECT
--     count(distinct site)
-- FROM `dw`.`dw_production_declaratives`
-- SELECT DISTINCT subquery.site, subquery.stock
-- FROM (
--     SELECT a.*, b.site_name, b.stock
--     FROM dm.dm_production_declaratives_in_situ_and_prodmass a
--     LEFT JOIN dm.dm_available_inventory_cards_siege_and_region b
--     ON a.site = b.site_name
-- ) AS subquery
-- WHERE stock IS NULL
--   AND site NOT LIKE 'CAMION%';

-- This tables records the number of card production per day
create VIEW dm.`dm_average_card_production_per_day`  AS(
WITH t1 AS (
    SELECT SUM(value) as total_sum
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_stock
    WHERE production_type = 'tous'
),
t2 AS (
    SELECT COUNT(DISTINCT period) as period_count
    FROM dm.dm_production_declaratives_in_situ_and_prodmass_stock
)
SELECT
    ROUND(t1.total_sum / t2.period_count, 0) as average_value
FROM t1
CROSS JOIN t2);


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

----this table records all of the the card production number(prod masse)
drop view if exists `dw`.`dw_production_declaratives_prodmasse_all_data`;
create view `dw`.`dw_production_declaratives_prodmasse_all_data`
as
select region,
       UPPER(coordination) as coordination,
       site,
       total,
       closing_date,
       period,
       'prod_masse' as production_type,
       period_type,
       value,
       etl_time
from `ods`.`ods_fichiers_sources_excel_production_declaratives_prodmasse` ;

----this table records the card production number(in situ&prod masse)
drop view if exists `dw`.`dw_production_declaratives_in_situ_and_prodmass_all_data`;
create view `dw`.`dw_production_declaratives_in_situ_and_prodmass_all_data` as
select
    region,
    coordination,
    site,
    total,
    closing_date,
    period,
    production_type,
    sum(value) as value
from
    (select
         region,
         coordination,
         site,
         total,
         closing_date,
         period,
         production_type,
         value
     from
         dw.`dw_production_declaratives_all_data`
     union all
     select region,
            coordination,
            site,
            total,
            closing_date,
            period,
            production_type,
            value
     from `dw`.`dw_production_declaratives_prodmasse_all_data`) dp
-- left join dim.dim_country_district a on dp.region=a.name
-- where closing_date is not null
group by region,coordination,site,total,closing_date,period,production_type;


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

-- 指标5：已修改离职率计算逻辑
-- 操作员离职率报表（月度）
-- 指标定义：按时间维度（月度）计算CMU接待人员离职率
-- 业务逻辑：
--   1. 分子：当月离职员工数量
--   2. 分母：当月月初（1日）在职员工数量
--   3. 离职率 = 离职人数 / 月初在职人数
-- Metric 5: Modified employee turnover rate calculation logic
-- Operator Turnover Rate Report (Monthly)
-- Metric Definition: Calculate CMU reception staff turnover rate by time dimension (monthly)
-- Business Logic:
--   1. Numerator: Number of employees who left in the current month
--   2. Denominator: Number of employees active at the beginning of the current month (1st day)
--   3. Turnover Rate = Number of departures / Number of active employees at month beginning
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_monthly;
CREATE  VIEW dm.dm_operator_turnover_rate_monthly COMMENT 'VIEW' AS
WITH all_months AS (
    -- 生成连续的月份（从最早入职日期到当前日期）
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month,INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            -- 获取第一个月的第一天
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
    -- 每月离职人数
    SELECT
        DATE_FORMAT(departure_date, '%Y%m') as month_key,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE departure_date IS NOT NULL AND departure_date <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y%m')
) departure ON all_months.month_key = departure.month_key
LEFT JOIN (
    -- 每月初在职人数
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
        -- 员工在该月第一天之前入职
        EXISTS (
            SELECT 1
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement` e
            WHERE e.employee_id = emp_months.employee_id
            -- 员工在该月第一天之前入职
            AND e.start_date <= STR_TO_DATE(CONCAT(emp_months.month_key, '01'), '%Y%m%d')
            -- 并且在该月第一天之后离职或尚未离职
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



-- 指标5：操作员离职率报表（年度）
-- 指标定义：按时间维度（年度）计算操作员离职率
-- 业务逻辑：
--   1. 分子：年度离职员工数量
--   2. 分母：年度年初（1月1日）在职员工数量
--   3. 离职率 = 年度离职人数 / 年初在职人数
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_yearly;
CREATE  VIEW dm.dm_operator_turnover_rate_yearly COMMENT 'VIEW' AS
WITH all_years AS (
    -- 生成连续的年度（从最早入职年份到当前年份）
    SELECT DISTINCT DATE_FORMAT(year_date, '%Y') as year_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_year,INTERVAL t1 YEAR) as year_date
        FROM (
            -- 获取第一个年的第一天：取所有员工中最早入职日期的当年1月1日
            SELECT
                DATE_FORMAT(MIN(start_date), '%Y-01-01') as first_day_of_first_year
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
            WHERE start_date IS NOT NULL
        ) first_year
        -- 生成0-99的数字序列，用于生成连续年度
        CROSS JOIN (SELECT 0 as t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1
        CROSS JOIN (SELECT 0 as t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2
        WHERE DATE_ADD(
                first_day_of_first_year,
                INTERVAL (t2*10 + t1) YEAR
            ) <= CURDATE()
    ) year_dates
)
SELECT
    COALESCE(departure.departure_num, 0) as departure_num,  -- 年度离职人数
    COALESCE(active.active_num, 0) as active_num,          -- 年初在职人数
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / COALESCE(active.active_num, 0), 2)  -- 年度离职率
    END as departure_rate,
    all_years.year_key as analysis_year,
    COALESCE(departure.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM all_years
LEFT JOIN (
    -- 每年离职人数
    SELECT
        DATE_FORMAT(departure_date, '%Y') as year_key,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE departure_date IS NOT NULL AND departure_date <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y')
) departure ON all_years.year_key = departure.year_key
LEFT JOIN (
    -- 每年初（1月1日）在职人数
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
        -- 员工在该年1月1日之前入职，且1月1日当天未离职
        EXISTS (
            SELECT 1
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement` e
            WHERE e.employee_id = emp_years.employee_id
            -- 入职时间 <= 当年1月1日
            AND e.start_date <= STR_TO_DATE(CONCAT(emp_years.year_key, '0101'), '%Y%m%d')
            -- 离职时间 > 当年1月1日 或 未离职
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




-- 指标5：新增操作员离职率报表（月度、站点）
-- 指标定义：按时间维度月度和站点维度计算操作员离职率
-- 业务逻辑：
--   1. 分子：当月离职员工数量
--   2. 分母：当月月初（1日）在职员工数量
--   3. 离职率 = 离职人数 / 月初在职人数
-- Operator Turnover Rate Report (Monthly, by Site)
-- Metric Definition: Calculate operator turnover rate by time dimension (monthly) and site dimension
-- Business Logic:
--   1. Numerator: Number of employees who left in the current month
--   2. Denominator: Number of employees active at the beginning of the current month (1st day)
--   3. Turnover Rate = Number of departures / Number of active employees at month beginning
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_monthly_by_site;
CREATE VIEW dm.`dm_operator_turnover_rate_monthly_by_site` COMMENT 'VIEW' AS
WITH all_months AS (
    -- 生成连续的月份（从最早入职日期到当前日期）
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month, INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            -- 获取第一个月的第一天
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
    -- 获取所有站点
    SELECT DISTINCT assigned_site
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE assigned_site IS NOT NULL AND assigned_site <> ''
),
month_site_combinations AS (
    -- 生成月份和站点的所有组合
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
    DATE_FORMAT(STR_TO_DATE(msc.month_key,'%Y%m'), '%b-%Y') as month,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM month_site_combinations msc
LEFT JOIN (
    -- 每月每个站点的离职人数
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
    -- 每月初每个站点的在职人数
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
        -- 员工在该月第一天之前入职
        start_date <= STR_TO_DATE(CONCAT(month_key, '01'), '%Y%m%d')
        -- 并且在该月第一天之后离职或尚未离职
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



-- 指标5：新增操作员离职率报表（年度、站点）
-- 指标定义：按时间维度年度和站点维度计算操作员离职率
-- 业务逻辑：
--   1. 分子：年度离职员工数量
--   2. 分母：年度年初（1月1日）在职员工数量
--   3. 离职率 = 年度离职人数 / 年初在职人数
-- Operator Turnover Rate Report (Annual, by Site)
-- Metric Definition: Calculate operator turnover rate by time dimension (annual) and site dimension
-- Business Logic:
--   1. Numerator: Number of employees who left in the current year
--   2. Denominator: Number of employees active at the beginning of the current year (January 1st)
--   3. Turnover Rate = Annual departures / Active employees at year beginning
DROP VIEW IF EXISTS dm.dm_operator_turnover_rate_yearly_by_site;
CREATE VIEW dm.`dm_operator_turnover_rate_yearly_by_site` COMMENT 'VIEW' AS
WITH all_years AS (
    -- 生成连续的年度（从最早入职日期所在年到当前年份）
    SELECT DISTINCT DATE_FORMAT(year_date, '%Y') as year_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_year, INTERVAL t1 YEAR) as year_date
        FROM (
            -- 获取第一个入职年份的1月1日
            SELECT
                DATE_FORMAT(MIN(start_date), '%Y-01-01') as first_day_of_first_year
            FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
            WHERE start_date IS NOT NULL
        ) first_year
        -- 生成0-20的数字（覆盖20年，可根据实际需求调整）
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
    -- 获取所有非空站点
    SELECT DISTINCT assigned_site
    FROM `internal`.`dw`.`dw_fichier_operateur_enrolement`
    WHERE assigned_site IS NOT NULL AND assigned_site <> ''
),
year_site_combinations AS (
    -- 生成年度和站点的所有组合（确保无数据的年/站点也能显示）
    SELECT
        ay.year_key,
        s.assigned_site
    FROM all_years ay
    CROSS JOIN all_sites s
)
SELECT
    ysc.assigned_site,  -- 站点
    COALESCE(departure.departure_num, 0) as departure_num,  -- 年度离职人
    COALESCE(active.active_num, 0) as active_num,  -- 年初在职人数
    -- 年度离职率
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0
        ELSE ROUND(COALESCE(departure.departure_num, 0) / COALESCE(active.active_num, 0), 2)
    END as departure_rate,
    ysc.year_key as analysis_year,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM year_site_combinations ysc
LEFT JOIN (
    -- 每年每个站点的离职人数
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
    -- 每年初（1月1日）每个站点的在职人数
    SELECT
        year_key,
        assigned_site,
        COUNT(DISTINCT employee_id) as active_num,  -- 年初在职人数
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
        -- 员工在该年1月1日前已入职
        start_date <= STR_TO_DATE(CONCAT(year_key, '0101'), '%Y%m%d')
        -- 员工在该年1月1日后离职，或尚未离职
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


-- 指标39：已修改离职率计算逻辑
-- CMU接待人员离职率报表（每月）
-- 指标定义：按时间维度月度计算CMU接待人员离职率
-- 业务逻辑：
--   1. 分子：当月离职员工数量
--   2. 分母：当月月初（1日）在职员工数量
--   3. 离职率 = 离职人数 / 月初在职人数
-- CMU Reception Staff Turnover Rate Report (Monthly)
-- Metric Definition: Calculate CMU reception staff turnover rate by time dimension (monthly)
-- Business Logic:
--   1. Numerator: Number of employees who left in the current month
--   2. Denominator: Number of employees active at the beginning of the current month (1st day)
--   3. Turnover Rate = Number of departures / Number of active employees at month beginning
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_monthly`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_monthly` COMMENT 'VIEW' AS
WITH all_months AS (
    -- 生成连续的月份（从最早入职日期到当前日期）
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month,INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            -- 获取第一个月的第一天
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
    -- 每月离职人数
    SELECT
        DATE_FORMAT(departure_date, '%Y%m') as month_key,
        COUNT(1) as departure_num,
        MAX(etl_time) as etl_time
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE departure_date IS NOT NULL AND departure_date <> ''
    GROUP BY DATE_FORMAT(departure_date, '%Y%m')
) departure ON all_months.month_key = departure.month_key
LEFT JOIN (
    -- 每月初在职人数
    SELECT
        am.month_key,
        COUNT(DISTINCT emp.employee_id) as active_num
    FROM all_months am
    LEFT JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
        ON emp.start_date_of_employment IS NOT NULL
        -- 员工在该月第一天之前入职
        AND emp.start_date_of_employment <= STR_TO_DATE(CONCAT(am.month_key, '01'), '%Y%m%d')
        -- 并且在该月第一天之后离职或尚未离职
        AND (
            emp.departure_date IS NULL
            OR emp.departure_date = ''
            OR emp.departure_date > STR_TO_DATE(CONCAT(am.month_key, '01'), '%Y%m%d')
        )
    GROUP BY am.month_key
) active ON all_months.month_key = active.month_key
WHERE active_num IS NOT NULL
ORDER BY all_months.month_key;



-- 指标39：CMU接待人员离职率报表（每年）
-- 指标定义：按时间维度年度计算CMU接待人员离职率
-- 业务逻辑：
--   1. 分子：年度离职员工数量
--   2. 分母：年度年初（1月1日）在职员工数量
--   3. 离职率 = 年度离职人数 / 年初在职人数
-- CMU Reception Staff Turnover Rate Report (Annual)
-- Metric Definition: Calculate CMU reception staff turnover rate by time dimension (annual)
-- Business Logic:
--   1. Numerator: Number of employees who left in the current year
--   2. Denominator: Number of employees active at the beginning of the current year (January 1st)
--   3. Turnover Rate = Annual departures / Active employees at year beginning
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_yearly`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_yearly` COMMENT 'VIEW' AS
WITH all_years AS (
    -- 生成连续的年度（从最早入职年份到当前年份）
    SELECT DISTINCT year_key
    FROM (
        SELECT
            DATE_FORMAT(DATE_ADD(first_year_start, INTERVAL t1 YEAR), '%Y') as year_key
        FROM (
            -- 获取最早入职年份的1月1日
            SELECT
                COALESCE(DATE_FORMAT(MIN(start_date_of_employment), '%Y-01-01'), CURDATE()) as first_year_start
            FROM `internal`.`dw`.`dw_depart_agent_accueil`
            WHERE start_date_of_employment IS NOT NULL
        ) first_year
        -- 生成0-30的数字（覆盖30年，可根据实际业务调整）
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
    COALESCE(departure.departure_num, 0) as departure_num,       -- 年度离职人数
    COALESCE(active.active_num, 0) as active_num,       -- 年初在职人数
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0.00
        ELSE ROUND(COALESCE(departure.departure_num, 0) / active.active_num, 2)
    END as departure_rate,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP()) as etl_time
FROM all_years y
LEFT JOIN (
    -- 每年的离职人数
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
    -- 每年初（1月1日）的在职人数
    SELECT
        y_inner.year_key,
        COUNT(DISTINCT emp.employee_id) as active_num,
        MAX(emp.etl_time) as etl_time
    FROM all_years y_inner
    CROSS JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
    WHERE emp.start_date_of_employment IS NOT NULL
      -- 员工在该年1月1日前已入职
      AND emp.start_date_of_employment <= STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      -- 员工在该年1月1日后离职，或尚未离职
      AND (
          emp.departure_date IS NULL
          OR emp.departure_date = ''
          OR emp.departure_date > STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      )
    GROUP BY y_inner.year_key
) active ON y.year_key = active.year_key
ORDER BY y.year_key ASC;



-- 指标39：新增CMU接待人员离职率报表（月度、卫生中心）
-- 指标定义：按时间维度月度和卫生中心维度计算CMU接待人员离职率
-- 业务逻辑：
--   1. 分子：当月离职员工数量
--   2. 分母：当月月初（1日）在职员工数量
--   3. 离职率 = 离职人数 / 月初在职人数
-- CMU Reception Staff Turnover Rate Report (Monthly, by Health Center)
-- Metric Definition: Calculate CMU reception staff turnover rate by time dimension (monthly) and health center dimension
-- Business Logic:
--   1. Numerator: Number of employees who left in the current month
--   2. Denominator: Number of employees active at the beginning of the current month (1st day)
--   3. Turnover Rate = Number of departures / Number of active employees at month beginning
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_monthly_by_health_center`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_monthly_by_health_center` COMMENT 'VIEW' AS
WITH all_months AS (
    -- 生成连续的月份（从最早入职日期到当前日期）
    SELECT DISTINCT DATE_FORMAT(month_date, '%Y%m') as month_key,
           DATE_FORMAT(month_date, '%Y-%m-01') as month_first_day
    FROM (
        SELECT
            DATE_ADD(first_day_of_first_month, INTERVAL (t2*10 + t1) MONTH) as month_date
        FROM (
            -- 获取第一个月的第一天
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
    -- 获取所有卫生中心
    SELECT DISTINCT assigned_health_center
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE assigned_health_center IS NOT NULL
      AND TRIM(assigned_health_center) <> ''
),
month_center_combinations AS (
    -- 生成月份和卫生中心的所有组合
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
    DATE_FORMAT(STR_TO_DATE(mcc.month_key,'%Y%m'), '%b-%Y') as month,
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP) as etl_time
FROM month_center_combinations mcc
LEFT JOIN (
    -- 每月每个卫生中心的离职人数
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
    -- 每月初每个卫生中心的在职人数
    SELECT
        mcc.month_key,
        mcc.assigned_health_center,
        COUNT(DISTINCT emp.employee_id) as active_num,
        MAX(emp.etl_time) as etl_time
    FROM month_center_combinations mcc
    LEFT JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
        ON mcc.assigned_health_center = emp.assigned_health_center
        AND emp.start_date_of_employment IS NOT NULL
        -- 员工在该月第一天之前入职
        AND emp.start_date_of_employment <= mcc.month_first_day
        -- 并且在该月第一天之后离职或尚未离职
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



-- 指标39：新增CMU接待人员离职率报表（年度、卫生中心）
-- CMU Reception Staff Turnover Rate Report (Annual, by Health Center)
-- 指标定义：按时间维度（年度）和卫生中心维度计算CMU接待人员离职率
-- Metric Definition: Calculate CMU reception staff turnover rate by time dimension (annual) and health center dimension
-- 业务逻辑：
--   1. 分子：年度离职员工数量
--   2. 分母：年度年初（1月1日）在职员工数量
--   3. 离职率 = 年度离职人数 / 年初在职人数
-- Business Logic:
--   1. Numerator: Number of employees who left in the current year
--   2. Denominator: Number of employees active at the beginning of the current year (January 1st)
--   3. Turnover Rate = Annual departures / Active employees at year beginning
DROP VIEW IF EXISTS dm.`dm_reception_staff_turnover_rate_yearly_by_health_center`;
CREATE VIEW dm.`dm_reception_staff_turnover_rate_yearly_by_health_center`
COMMENT 'VIEW' AS
WITH all_years AS (
    -- 生成连续年度（从最早入职年到当前年）
    SELECT DISTINCT year_key
    FROM (
        SELECT
            DATE_FORMAT(DATE_ADD(first_year_start, INTERVAL t1 YEAR), '%Y') as year_key
        FROM (
            -- 获取最早入职年份的1月1日
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
    -- 获取卫生中心
    SELECT DISTINCT TRIM(assigned_health_center) as assigned_health_center
    FROM `internal`.`dw`.`dw_depart_agent_accueil`
    WHERE assigned_health_center IS NOT NULL
      AND TRIM(assigned_health_center) <> ''
),
year_hc_combinations AS (
    -- 生成年度和卫生中心组合
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
    -- 离职率
    CASE
        WHEN COALESCE(active.active_num, 0) = 0 THEN 0.00
        ELSE ROUND(COALESCE(departure.departure_num, 0) / active.active_num, 2)
    END as departure_rate,  -- 年度离职率
    yhc.year_key as analysis_year,  -- 分析年度
    COALESCE(departure.etl_time, active.etl_time, CURRENT_TIMESTAMP()) as etl_time
FROM year_hc_combinations yhc
LEFT JOIN (
    -- 每年每个卫生中心的离职人数
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
    -- 每年初每个卫生中心的在职人数
    SELECT
        y_inner.year_key,
        TRIM(emp.assigned_health_center) as assigned_health_center,
        COUNT(DISTINCT emp.employee_id) as active_num,         MAX(emp.etl_time) as etl_time
    FROM all_years y_inner
    CROSS JOIN `internal`.`dw`.`dw_depart_agent_accueil` emp
    WHERE emp.assigned_health_center IS NOT NULL
      AND TRIM(emp.assigned_health_center) <> ''
      AND emp.start_date_of_employment IS NOT NULL
      -- 员工在该年1月1日前已入职
      AND emp.start_date_of_employment <= STR_TO_DATE(CONCAT(y_inner.year_key, '-01-01'), '%Y-%m-%d')
      -- 员工在该年1月1日后离职，或尚未离职
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

-- this table defines the coverage rate of the contracted health center
drop table `dm`.`dm_bm_health_centers_contracted_type_level_coverage_rate_num`;
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
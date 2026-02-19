/*NO.24 Stock de cartes vierge préimprimées disponibles*/

-- ODS LAYER
-- This table stores the available inventory of blank pre-printed cards for each site.
DROP TABLE if exists ods.ods_fichiers_sources_excel_cartes_sites;
CREATE TABLE ods.ods_fichiers_sources_excel_cartes_sites (
                                                             `region` VARCHAR(255) NULL,
                                                             `department` VARCHAR(255) NULL,
                                                             `sub_prefecture_commune` VARCHAR(255) NULL,
                                                             `site_name` VARCHAR(255) NULL,
                                                             `type` VARCHAR(255) NULL,
                                                             `number_of_cards_in_stock` DOUBLE NULL,
                                                             `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
    DUPLICATE KEY(`region`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`region`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);



-- This table stores records of pre-printed blank cards being issued and returned to inventory.
DROP TABLE if exists ods.ods_fichiers_sources_excel_cartes_siege;
CREATE TABLE ods.ods_fichiers_sources_excel_cartes_siege (
                                                             `status` VARCHAR(255) NULL,
                                                             `delivery_date` DATE NULL,
                                                             `number_of_crates` BIGINT NULL,
                                                             `number_of_lattes_per_crate` BIGINT NULL,
                                                             `total_lattes` BIGINT NULL,
                                                             `number_of_cards_per_latte` BIGINT NULL,
                                                             `total_cards` BIGINT NULL,
                                                             `destination` VARCHAR(255) NULL,
                                                             `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
    DUPLICATE KEY(`status`, `delivery_date`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`status`, `delivery_date`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);

-- DW LAYER
-- dw.`dw_cartes_sites`
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

-- dw.`dw_cartes_siege`
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




-- DM LAYER
-- This table records the number of inventory cards at headquarters and the number of blank cards available in each region.
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

-- This table stores the quantity of preprinted blank cards by region.
DROP VIEW IF EXISTS dm.`dm_available_blank_cards_by_region`;
CREATE
    VIEW dm.`dm_available_blank_cards_by_region`  AS
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
DROP VIEW IF EXISTS dm.dm_available_inventory_cards_total;
CREATE
    VIEW dm.dm_available_inventory_cards_total  AS
select
    sum(number_of_cards_in_stock) as total_number_of_cards_in_stock,
    max(etl_time)as etl_time
from
    `dw`.`dw_cartes_sites`;



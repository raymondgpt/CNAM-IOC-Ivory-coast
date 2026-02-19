-- dw.dw_campagne_communication source(计算推广活动)

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


-- dw.dw_cartes_sites source（计算白卡库存）

CREATE OR REPLACE
VIEW `dw_cartes_sites` COMMENT 'VIEW' AS
select
    region,
    department,
    sub_prefecture_commune,
    site_name,
    type as site_type,
    number_of_cards_in_stock,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_cartes_sites`;


-- dw.dw_depart_agent_accueil source（计算入职离职率）

CREATE OR REPLACE
VIEW `dw_depart_agent_accueil` COMMENT 'VIEW' AS
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


-- dw.dw_fichier_operateur_enrolement source（维度表，维护招募人员的信息 ）

CREATE OR REPLACE
VIEW `dw_fichier_operateur_enrolement` COMMENT 'VIEW' AS
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


-- dw.dw_liste_centres_sante source（维度表，维护卫生院的信息）

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


-- dw.dw_liste_centres_sante_conventionnes source（维度表，维护签约卫生院的信息）

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


-- dw.dw_liste_pharmacie source（维度表，维护药房信息）

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


-- dw.dw_liste_pharmacie_conventionnes source（维度表，维护签约药房信息）

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


-- dw.dw_notoriete_cnam source(事实表，记录知名度)

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


-- dw.dw_production_declaratives source

CREATE OR REPLACE
VIEW `dw_production_declaratives` COMMENT 'VIEW' AS
select
    coordination,
    region,
    departement,
    total,
    period,
    period_type,
    value,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_production_declaratives`
where
    value is not null;


-- dw.dw_production_declaratives_days source（结果表，记录每天的发卡量，但逻辑没看明白，回到现场环境看表结果，这里的代码看要不要重写）

CREATE OR REPLACE
VIEW `dw_production_declaratives_days` COMMENT 'VIEW' AS
select
    AA.coordination,
    AA.region,
    AA.departement,
    AA.total,
    BB.diff_days,
    AA.total / BB.diff_days as daily_num
from
    (
    select
        coordination,
        region,
        departement,
        total
    from
        `internal`.`dw`.`dw_production_declaratives`
    group by
        coordination,
        region,
        departement,
        total) AA
inner join (
    select
        datediff(a.max_day, b.min_day)+1 as diff_days
    from
        (
        select
            max(period) as max_day
        from
            `internal`.`dw`.`dw_production_declaratives`
        where
            period_type = 'day')a
    inner join (
        select
            concat(min(period), '-01-01') as min_day
        from
            `internal`.`dw`.`dw_production_declaratives`
        where
            period_type = 'year')b) BB;


-- dw.dw_site_enrolement source(记录每个站点的卡注册数)

CREATE OR REPLACE
VIEW `dw_site_enrolement` COMMENT 'VIEW' AS
select
    region,
    department,
    sub_prefecture_commune,
    site_name,
    type,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_site_enrolement`;


-- dw.dw_visite_site_web source（事实表，记录每个网站的浏览数）

CREATE OR REPLACE
VIEW `dw_visite_site_web` COMMENT 'VIEW' AS
select
    date as visite_date,
    number_of_visitors,
    etl_time
from
    `internal`.`ods`.`ods_fichiers_sources_excel_visite_site_web`;
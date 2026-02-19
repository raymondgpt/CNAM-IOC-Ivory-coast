-- dm.dm_bm_number_contracted_pharmacies_region source(通过分组计数，计算每个region的签约药房数)

CREATE OR REPLACE
VIEW `dm_bm_number_contracted_pharmacies_region` COMMENT 'VIEW' AS
select
    A.sanitary_region,
    B.geo_name,
    A.sanitary_number,
    A.etl_time
from
    (
    select
        sanitary_region,
        count(1) as sanitary_number,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_liste_pharmacie_conventionnes`
    group by
        sanitary_region) A
left join `internal`.`dim`.`dim_country_district` B on
    A.sanitary_region = B.name;


-- dm.dm_bm_number_health_centers_daily source(通过分组计数，计算每天的新签约卫生院数)

CREATE OR REPLACE
VIEW `dm_bm_number_health_centers_daily` COMMENT 'VIEW' AS
select
    cast(date_format(contract_date, '%Y%m%d') as int) as contract_date,
    count(1) as health_centers_number,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_liste_centres_sante_conventionnes`
where
    contract_date is not null
group by
    date_format(contract_date, '%Y%m%d');


-- dm.dm_bm_number_health_centers_monthly source(通过分组计数，计算每月的新签约卫生院数)

CREATE OR REPLACE
VIEW `dm_bm_number_health_centers_monthly` COMMENT 'VIEW' AS
select
    cast(date_format(contract_date, '%Y%m') as int) as contract_month,
    count(1) as health_centers_number,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_liste_centres_sante_conventionnes`
    where contract_date is not null
group by
    date_format(contract_date, '%Y%m');


-- dm.dm_bm_number_health_centers_region source(通过分组计数，计算每个region的新签约卫生院数)

CREATE OR REPLACE
VIEW `dm_bm_number_health_centers_region` COMMENT 'VIEW' AS
select
    A.health_region,
    B.geo_name,
    A.health_centers_number,
    A.etl_time
from
    (
    select
        health_region,
        count(1) as health_centers_number,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_liste_centres_sante_conventionnes`
    group by
        health_region) A
left join `internal`.`dim`.`dim_country_district` B on
    A.health_region = B.name;


-- dm.dm_bm_number_health_centers_yearly source(通过分组计数，计算每年的新签约卫生院数)

CREATE OR REPLACE
VIEW `dm_bm_number_health_centers_yearly` COMMENT 'VIEW' AS
select
    cast(date_format(contract_date, '%Y') as int) as contract_year,
    count(1) as health_centers_number,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_liste_centres_sante_conventionnes`
    where contract_date is not null
group by
    date_format(contract_date, '%Y');


-- dm.dm_bm_number_pharmacie_region source（通过分组计算，计算每个region新增的签约药房数）

CREATE OR REPLACE
VIEW `dm_bm_number_pharmacie_region` COMMENT 'VIEW' AS
select
    A.regions,
    B.geo_name,
    A.pharmacie_number,
    A.etl_time
from
    (
    select
        regions,
        count(1) as pharmacie_number,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_liste_pharmacie`
    group by
        regions) A
left join `internal`.`dim`.`dim_country_district` B on
    A.regions = B.name;


-- dm.dm_bm_number_sanitary_centers_region source（通过分组计算，计算每个region的卫生院数量）

CREATE OR REPLACE
VIEW `dm_bm_number_sanitary_centers_region` COMMENT 'VIEW' AS
select
    A.sanitary_region,
    B.geo_name,
    A.sanitary_number,
    A.etl_time
from
    (
    select
        sanitary_region,
        count(1) as sanitary_number,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_liste_centres_sante`
    group by
        sanitary_region) A
left join `internal`.`dim`.`dim_country_district` B on
    A.sanitary_region = B.name;


-- dm.dm_bm_pharmacy_network_coverage_rate_region source（分别对每个region现有药房和新增签约药房进行分组计数进行分组计数，用得出的值去算覆盖率）

CREATE OR REPLACE
VIEW `dm_bm_pharmacy_network_coverage_rate_region` COMMENT 'VIEW' AS
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


-- dm.dm_ccm_cnam_awareness_rate_yearly source（计算年度知名度率）

CREATE OR REPLACE
VIEW `dm_ccm_cnam_awareness_rate_yearly` COMMENT 'VIEW' AS
select
    notoriete_year,
    cast(rate as double) as rate,
    etl_time
from
    `internal`.`dw`.`dw_notoriete_cnam`;


-- dm.dm_ccm_communication_campaigns_conducted_number source（以分组计数的方式分别按照年和年月计算活动表中的活动数量，并合并一起）

CREATE OR REPLACE
VIEW `dm_ccm_communication_campaigns_conducted_number` COMMENT 'VIEW' AS
select
    'mois' as period_type,
    concat(campagne_year, campagne_month) as campagne_period,
    status,
    count(1) as campagne_num,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_campagne_communication`
where
    status = 'Réalisée'
group by
    concat(campagne_year, campagne_month),
    status
union all
select
    'année' as period_type,
    campagne_year as campagne_period,
    status,
    count(1) as campagne_num,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_campagne_communication`
where
    status = 'Réalisée'
group by
    campagne_year,
    status;


-- dm.dm_ccm_communication_campaigns_conducted_number_monthly source（按照年月去分组计算活动数）

CREATE OR REPLACE
VIEW `dm_ccm_communication_campaigns_conducted_number_monthly` COMMENT 'VIEW' AS
select
    concat(campagne_year, campagne_month) as campagne_month,
    status,
    count(1) as campagne_num,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_campagne_communication`
group by
    concat(campagne_year, campagne_month),
    status;


-- dm.dm_ccm_communication_campaigns_conducted_number_yearly source（按照年去分组计算活动数）

CREATE OR REPLACE
VIEW `dm_ccm_communication_campaigns_conducted_number_yearly` COMMENT 'VIEW' AS
select
    campagne_year,
    status,
    count(1) as campagne_num,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_campagne_communication`
group by
    campagne_year,
    status;


-- dm.dm_ccm_website_visitors_number_daily source(直接获取浏览量，无加工)

CREATE OR REPLACE
VIEW `dm_ccm_website_visitors_number_daily` COMMENT 'VIEW' AS
select
    cast(date_format(visite_date, '%Y%m%d') as int) as visite_date,
    number_of_visitors,
    etl_time
from
    `internal`.`dw`.`dw_visite_site_web`;


CREATE OR REPLACE
VIEW `dm_ccm_website_visitors_number_average_monthly` COMMENT 'VIEW' AS
select
    cast(date_format(visite_date, '%Y%m') as int) as visite_date,
    avg(number_of_visitors) as avg_visitor_number
from
    `internal`.`dw`.`dw_visite_site_web`
group by visite_date;


-- dm.dm_ccm_website_visitors_number_monthly source（以年月分组，对浏览量求和）

CREATE OR REPLACE
VIEW `dm_ccm_website_visitors_number_monthly` COMMENT 'VIEW' AS
select
    cast(date_format(visite_date, '%Y%m') as int) as visite_month,
    sum(number_of_visitors) as number_of_visitors,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_visite_site_web`
group by
    date_format(visite_date, '%Y%m');


-- dm.dm_ccm_website_visitors_number_yearly source（以年分组，对浏览量求和）
CREATE OR REPLACE
VIEW `dm_ccm_website_visitors_number_yearly` COMMENT 'VIEW' AS
select
    cast(date_format(visite_date, '%Y') as int) as visite_year,
    sum(number_of_visitors) as number_of_visitors,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_visite_site_web`
group by
    date_format(visite_date, '%Y');


-- dm.dm_cpm_available_inventory_preprinted_blank_cards_global_value source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_cpm_available_inventory_preprinted_blank_cards_global_value` COMMENT 'VIEW' AS
select
    sum(number_of_cards_in_stock) as total_number_of_cards_in_stock,
    max(etl_time)as etl_time
from
    `internal`.`dw`.`dw_cartes_sites`;


-- dm.dm_cpm_available_inventory_preprinted_blank_cards_region source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_cpm_available_inventory_preprinted_blank_cards_region` COMMENT 'VIEW' AS
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
        `internal`.`dw`.`dw_cartes_sites`
    group by
        region)A
left join `internal`.`dim`.`dim_country_district` B on
    A.region = B.name;


-- dm.dm_cpm_average_number_cards_produced_centre_rank source(这里的窗口函数没理解)

CREATE OR REPLACE
VIEW `dm_cpm_average_number_cards_produced_centre_rank` COMMENT 'VIEW' AS
select
    coordination,
    region,
    departement,
    total,
    diff_days,
    daily_num,
    row_number() over(order by daily_num desc) as rn
from
    `internal`.`dw`.`dw_production_declaratives_days`;


-- dm.dm_cpm_average_number_cards_produced_global_value source

CREATE OR REPLACE
VIEW `dm_cpm_average_number_cards_produced_global_value` COMMENT 'VIEW' AS
select
    sum(total) as total_sum,
    min(diff_days) as diff_days,
    sum(total)/ min(diff_days) as daily_num
from
    `internal`.`dw`.`dw_production_declaratives_days`;


-- dm.dm_cpm_average_number_cards_produced_region source（这个看看是否用到）

CREATE OR REPLACE
VIEW `dm_cpm_average_number_cards_produced_region` COMMENT 'VIEW' AS
select
    A.region,
    B.geo_name,
    A.daily_num
from
    (
    select
        region,
        sum(total) as total_num,
        min(diff_days) as diff_days,
        sum(total)/ min(diff_days) as daily_num
    from
        `internal`.`dw`.`dw_production_declaratives_days`
        where region is not null
        and region <> ''
    group by
        region) A
left join `internal`.`dim`.`dim_country_district` B on
    A.region = B.name;


-- dm.dm_cram_cmu_reception_staff_turnover_rate_monthly source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_cram_cmu_reception_staff_turnover_rate_monthly` COMMENT 'VIEW' AS
select
    A.departure_num,
    B.active_num,
    --临时方案，具体口径待确认
	case
        when B.active_num = 0 then 0
        else A.departure_num / B.active_num
    end as departure_rate,
    A.departure_month as departure_month,
    A.etl_time as etl_time
from
    (
    select
        date_format(departure_date, '%Y%m') as departure_month,
        count(1) as departure_num,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_depart_agent_accueil`
    where
        departure_date is not null
        and departure_date <> ''
    group by
        date_format(departure_date, '%Y%m')
) A
left join (
    select
        date_format(start_date_of_employment, '%Y%m') as start_month,
        count(1) as active_num,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_depart_agent_accueil`
    where
        start_date_of_employment is not null
        and start_date_of_employment <> ''
    group by
        date_format(start_date_of_employment, '%Y%m')
) B
on
    A.departure_month = B.start_month;


-- dm.dm_em_enrollment_sites_number_global_value source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_em_enrollment_sites_number_global_value` COMMENT 'VIEW' AS
select
    count(1) as total_site_num,
    max(etl_time) as etl_time
from
    `internal`.`dw`.`dw_site_enrolement`
where
    site_name is not null
    and site_name <> '';


-- dm.dm_em_enrollment_sites_number_management_center source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_em_enrollment_sites_number_management_center` COMMENT 'VIEW' AS
select
    type,
    count(1) as site_num,
    rank() over(order by count(1) desc) as ranking
from
    `internal`.`dw`.`dw_site_enrolement`
where
    type is not null
    and type <> ''
group by
    type;


-- dm.dm_em_enrollment_sites_number_region source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_em_enrollment_sites_number_region` COMMENT 'VIEW' AS
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
        `internal`.`dw`.`dw_site_enrolement`
    group by
        region) A
left join `internal`.`dim`.`dim_country_district` B on
    A.region = B.name;


-- dm.dm_em_enrollment_sites_number_region_copy1 source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_em_enrollment_sites_number_region_copy1` COMMENT 'VIEW' AS
select
    `internal`.`dm`.`dm_em_enrollment_sites_number_region`.`region`,
    `internal`.`dm`.`dm_em_enrollment_sites_number_region`.`geo_name`,
    `internal`.`dm`.`dm_em_enrollment_sites_number_region`.`site_num`,
    `internal`.`dm`.`dm_em_enrollment_sites_number_region`.`etl_time`
from
    `internal`.`dm`.`dm_em_enrollment_sites_number_region`;


-- dm.dm_em_enrollment_sites_number_region_copy2 source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_em_enrollment_sites_number_region_copy2` COMMENT 'VIEW' AS
select
    distinct geo_name,
    '' as region,
    site_num,
    etl_time
from
    `internal`.`dm`.`dm_em_enrollment_sites_number_region_copy1`
where
    site_num>2
order by
    geo_name;


-- dm.dm_mao_operator_turnover_rate_monthly source（客户没给数据，忽略）

CREATE OR REPLACE
VIEW `dm_mao_operator_turnover_rate_monthly` COMMENT 'VIEW' AS
select
    A.departure_num,
    B.active_num,
    case
        when B.active_num = 0 then 0
        else A.departure_num / B.active_num
    end as departure_rate,
    A.departure_month as departure_month,
    A.etl_time as etl_time
from
    (
    select
        date_format(departure_date, '%Y%m') as departure_month,
        count(1) as departure_num,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_fichier_operateur_enrolement`
    where
        departure_date is not null
        and departure_date <> ''
    group by
        date_format(departure_date, '%Y%m')
) A
left join (
    select
        date_format(start_date, '%Y%m') as start_month,
        count(1) as active_num,
        max(etl_time) as etl_time
    from
        `internal`.`dw`.`dw_fichier_operateur_enrolement`
    group by
        date_format(start_date, '%Y%m')
) B
on
    A.departure_month = B.start_month;


-- dm.dm_bm_cmu_healthcare_network_coverage_rate_region source（分别对每个region现有卫生院和新增签约卫生院进行分组计数进行分组计数，用得出的值去算覆盖率）

CREATE OR REPLACE
VIEW `dm_bm_cmu_healthcare_network_coverage_rate_region` COMMENT 'VIEW' AS
select
    A.geo_name,
    A.sanitary_number / B.health_centers_number as coverage_rate
from
    (select geo_name, sum(sanitary_number) as sanitary_number from `internal`.`dm`.`dm_bm_number_sanitary_centers_region` group by geo_name) A
left join (
    select
        geo_name,
        sum(health_centers_number) as health_centers_number
    from
        `internal`.`dm`.`dm_bm_number_health_centers_region`
    group by
        geo_name) B
on
    A.geo_name = B.geo_name;


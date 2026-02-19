-- ods.ods_fichiers_sources_excel_campagne_communication definition

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


-- ods.ods_fichiers_sources_excel_cartes_siege definition

CREATE TABLE `ods_fichiers_sources_excel_cartes_siege` (
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


-- ods.ods_fichiers_sources_excel_cartes_sites definition

CREATE TABLE `ods_fichiers_sources_excel_cartes_sites` (
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


-- ods.ods_fichiers_sources_excel_depart_agent_accueil definition

CREATE TABLE `ods_fichiers_sources_excel_depart_agent_accueil` (
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


-- ods.ods_fichiers_sources_excel_distribution_declaratives definition

CREATE TABLE `ods_fichiers_sources_excel_distribution_declaratives` (
  `coordination` VARCHAR(255) NULL,
  `region` VARCHAR(255) NULL,
  `departement` VARCHAR(255) NULL,
  `total` DOUBLE NULL,
  `period` VARCHAR(255) NULL,
  `period_type` VARCHAR(255) NULL,
  `value` DOUBLE NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`coordination`, `region`, `departement`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`coordination`, `region`, `departement`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_fichiers_sources_excel_lecteur_necessaire_centre definition

CREATE TABLE `ods_fichiers_sources_excel_lecteur_necessaire_centre` (
  `sanitary_region` VARCHAR(255) NULL,
  `sanitary_district` VARCHAR(255) NULL,
  `locality` VARCHAR(255) NULL,
  `cnam_ets_code` BIGINT NULL,
  `business_name` VARCHAR(255) NULL,
  `center_type` VARCHAR(255) NULL,
  `category` VARCHAR(255) NULL,
  `pyramid_level` BIGINT NULL,
  `required_readers_number` BIGINT NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`sanitary_region`, `sanitary_district`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sanitary_region`, `sanitary_district`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_fichiers_sources_excel_liste_centres_sante definition

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


-- ods.ods_fichiers_sources_excel_liste_centres_sante_conventionnes definition

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


-- ods.ods_fichiers_sources_excel_liste_pharmacie definition

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


-- ods.ods_fichiers_sources_excel_liste_pharmacie_conventionnes definition

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


-- ods.ods_fichiers_sources_excel_liste_pharmacie_privee_conventionnes definition

CREATE TABLE `ods_fichiers_sources_excel_liste_pharmacie_privee_conventionnes` (
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


-- ods.ods_fichiers_sources_excel_montant_cotisation_rec definition

CREATE TABLE `ods_fichiers_sources_excel_montant_cotisation_rec` (
  `category` VARCHAR(255) NULL,
  `channels` VARCHAR(255) NULL,
  `period` VARCHAR(255) NULL,
  `period_type` VARCHAR(255) NULL,
  `value` DOUBLE NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`category`, `channels`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`category`, `channels`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_fichiers_sources_excel_nombre_jour_travail definition

CREATE TABLE `ods_fichiers_sources_excel_nombre_jour_travail` (
  `registration_number` VARCHAR(255) NULL,
  `activity_type` VARCHAR(255) NULL,
  `operator_category` VARCHAR(255) NULL,
  `working_days_per_week` BIGINT NULL,
  `activity_start_date` DATE NULL,
  `activity_end_date` DATE NULL,
  `estimated_daily_hours` BIGINT NULL,
  `geographical_area` VARCHAR(255) NULL,
  `contract_type` VARCHAR(255) NULL,
  `frequency` VARCHAR(255) NULL,
  `comments` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`registration_number`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`registration_number`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_fichiers_sources_excel_notoriete_cnam definition

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


-- ods.ods_fichiers_sources_excel_production_declaratives definition

CREATE TABLE `ods_fichiers_sources_excel_production_declaratives` (
  `coordination` VARCHAR(255) NULL,
  `region` VARCHAR(255) NULL,
  `departement` VARCHAR(255) NULL,
  `total` DOUBLE NULL,
  `period` VARCHAR(255) NULL,
  `period_type` VARCHAR(255) NULL,
  `value` DOUBLE NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`coordination`, `region`, `departement`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`coordination`, `region`, `departement`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_fichiers_sources_excel_site_enrolement definition

CREATE TABLE `ods_fichiers_sources_excel_site_enrolement` (
  `region` VARCHAR(255) NULL,
  `department` VARCHAR(255) NULL,
  `sub_prefecture_commune` VARCHAR(255) NULL,
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


-- ods.ods_fichiers_sources_excel_visite_site_web definition

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


-- ods.ods_fichiers_sources_fichier_operateur_enrolement definition

CREATE TABLE `ods_fichiers_sources_fichier_operateur_enrolement` (
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


-- ods.ods_ivory_cmu_synth_ph definition

CREATE TABLE `ods_ivory_cmu_synth_ph` (
  `source` VARCHAR(256) NULL COMMENT '来源',
  `num_bon` VARCHAR(256) NULL COMMENT '单据编号',
  `date_prescription` DATE NULL COMMENT '处方日期',
  `annee` INT NULL COMMENT '年份',
  `mois` INT NULL COMMENT '月份',
  `date_servi` DATE NULL COMMENT '服务日期',
  `matricule` VARCHAR(256) NULL COMMENT '登记号',
  `date_naissance` DATE NULL COMMENT '出生日期',
  `sexe` VARCHAR(256) NULL COMMENT '性别',
  `lieu_residence` VARCHAR(256) NULL COMMENT '居住地点',
  `code_etab` VARCHAR(256) NULL COMMENT '机构代码',
  `raison_sociale_etab` VARCHAR(256) NULL COMMENT '机构名称',
  `localite_etab` VARCHAR(256) NULL COMMENT '机构所在地',
  `district_sanitaire_etab` VARCHAR(256) NULL COMMENT '机构所属卫生区',
  `region_etab` VARCHAR(256) NULL COMMENT '机构所属大区',
  `code_pathologie` VARCHAR(256) NULL COMMENT '疾病代码',
  `libelle_pathologie` VARCHAR(256) NULL COMMENT '疾病名称',
  `code_soins` VARCHAR(256) NULL COMMENT '诊疗项目代码',
  `libelle_soins` VARCHAR(256) NULL COMMENT '诊疗项目名称',
  `famille_soins` VARCHAR(256) NULL COMMENT '诊疗项目大类',
  `sous_famille_soins` VARCHAR(256) NULL COMMENT '诊疗项目子类',
  `code_affection` VARCHAR(256) NULL COMMENT '病症代码',
  `cout_unitaire` VARCHAR(256) NULL COMMENT '单价',
  `quantite` VARCHAR(256) NULL COMMENT '数量',
  `montant_total` VARCHAR(256) NULL COMMENT '总金额',
  `part_cnam` VARCHAR(256) NULL COMMENT '国家健康保险基金承担部分',
  `part_mugefci` VARCHAR(256) NULL COMMENT 'MUGEFCI承担部分',
  `part_assure` VARCHAR(256) NULL COMMENT '参保人承担部分',
  `type_soins` VARCHAR(256) NULL COMMENT '诊疗类型'
) ENGINE=OLAP
DUPLICATE KEY(`source`, `num_bon`, `date_prescription`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`source`, `num_bon`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_cotisation_paiement_web definition

CREATE TABLE `ods_user_cnam_cotisation_paiement_web` (
  `num_ordre` BIGINT NOT NULL COMMENT '订单编号',
  `channel` VARCHAR(45) NULL COMMENT '渠道',
  `payment_type` VARCHAR(1) NULL COMMENT '支付类型',
  `code_ogd` VARCHAR(8) NULL COMMENT 'OGD代码',
  `code_collectivite` VARCHAR(9) NULL COMMENT '行政区代码',
  `caisse` VARCHAR(9) NULL COMMENT '社保机构代码',
  `num_secu` VARCHAR(13) NULL COMMENT '社保号',
  `assure_montant` BIGINT NULL COMMENT '参保人金额',
  `statut` TINYINT NULL COMMENT '状态',
  `num_transaction` VARCHAR(255) NULL COMMENT '交易编号',
  `transaction_amount` VARCHAR(10) NULL COMMENT '交易金额',
  `currency` VARCHAR(3) NULL COMMENT '货币代码',
  `paid_transaction_amount` BIGINT NULL COMMENT '已支付金额',
  `paid_currency` VARCHAR(3) NULL COMMENT '支付货币代码',
  `change_rate` VARCHAR(20) NULL COMMENT '汇率',
  `conflictual_transaction_amount` BIGINT NULL COMMENT '争议金额',
  `conflictual_currency` VARCHAR(3) NULL COMMENT '争议货币代码',
  `wallet` VARCHAR(30) NULL COMMENT '钱包类型',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` BIGINT NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户',
  `statut_traitement` BIGINT NULL DEFAULT "0" COMMENT '处理状态'
) ENGINE=OLAP
UNIQUE KEY(`num_ordre`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`num_ordre`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_ecmu_assures definition

CREATE TABLE `ods_user_cnam_ecmu_assures` (
  `num_secu` VARCHAR(13) NOT NULL COMMENT '社保号码（主键）',
  `affiliation` TINYINT NULL COMMENT '参保状态',
  `prestation` TINYINT NULL COMMENT '福利状态',
  `traitement` TINYINT NULL COMMENT '处理状态',
  `active` TINYINT NULL COMMENT '激活状态',
  `statut` VARCHAR(3) NULL COMMENT '状态',
  `difusion_affiliation` TINYINT NULL COMMENT '参保信息扩散状态',
  `motif` VARCHAR(100) NULL COMMENT '原因',
  `code_ogd_prestations` VARCHAR(8) NULL COMMENT '福利机构代码',
  `code_ogd_prestations_prov` VARCHAR(8) NULL COMMENT '临时福利机构代码',
  `code_ogd_cotisations` VARCHAR(8) NULL COMMENT '缴费机构代码',
  `matricule_ogd_cotisations` VARCHAR(30) NULL COMMENT '缴费机构登记号',
  `executant_referent_prov` VARCHAR(9) NULL COMMENT '临时参考执行者',
  `type_mouvement` VARCHAR(3) NULL COMMENT '变动类型',
  `date_situation` DATE NULL COMMENT '情况日期',
  `identifiant_personne` VARCHAR(15) NULL COMMENT '人员标识',
  `identifiant_dde_pers` BIGINT NULL COMMENT '人员申请标识',
  `cle_secu` VARCHAR(15) NULL COMMENT '社保密钥',
  `num_carte` VARCHAR(20) NULL COMMENT '卡片号码',
  `civilite` VARCHAR(3) NULL COMMENT ' civility（身份）',
  `nom` VARCHAR(50) NULL COMMENT '姓氏',
  `nom_patronymique` VARCHAR(30) NULL COMMENT '父姓',
  `prenom` VARCHAR(50) NULL COMMENT '名字',
  `sexe` VARCHAR(1) NULL COMMENT '性别',
  `qualite_civile` VARCHAR(5) NULL COMMENT '公民身份',
  `date_naissance` DATE NULL COMMENT '出生日期',
  `date_naissance_lunaire` DATE NULL COMMENT '农历出生日期',
  `rang_gemellaire` VARCHAR(3) NULL COMMENT '双胞胎排行',
  `nationalite` VARCHAR(3) NULL COMMENT '国籍',
  `situation_familiale` VARCHAR(3) NULL COMMENT '家庭状况',
  `categorie_professionnelle` VARCHAR(3) NULL COMMENT '职业类别',
  `grand_regime` VARCHAR(2) NULL COMMENT '大体制',
  `caisse` VARCHAR(5) NULL COMMENT '金库',
  `centre_payeur` VARCHAR(9) NULL COMMENT '支付中心',
  `date_premiere_immat` DATE NULL COMMENT '首次登记日期',
  `cplt_grand_regime` VARCHAR(3) NULL COMMENT '大体制补充',
  `date_entree_organisme` DATE NULL COMMENT '进入机构日期',
  `date_anciennete_organisme` DATE NULL COMMENT '机构资历日期',
  `langue` VARCHAR(5) NULL COMMENT '语言',
  `statut_contrat` VARCHAR(3) NULL COMMENT '合同状态',
  `assure_payeur_o_n` TINYINT NULL COMMENT '参保人是否为支付者',
  `date_affiliation` DATE NULL COMMENT '参保日期',
  `date_delivrance_carte` DATE NULL COMMENT '卡片发放日期',
  `profession` VARCHAR(5) NULL COMMENT '职业',
  `executant_referent` VARCHAR(15) NULL COMMENT '参考执行者',
  `date_sortie_organisme` DATE NULL COMMENT '离开机构日期',
  `motif_sortie_organisme` VARCHAR(5) NULL COMMENT '离开机构原因',
  `date_deces` DATE NULL COMMENT '死亡日期',
  `statut_personne` VARCHAR(5) NULL COMMENT '人员状态',
  `code_agence` VARCHAR(10) NULL COMMENT '机构代码',
  `code_commercial` VARCHAR(10) NULL COMMENT '商业代码',
  `nom_usage` VARCHAR(50) NULL COMMENT '常用名',
  `naissance_pays` VARCHAR(3) NULL COMMENT '出生国家',
  `naissance_lieu` VARCHAR(50) NULL COMMENT '出生地点',
  `naissance_cplt_lieu` VARCHAR(50) NULL COMMENT '出生地点补充',
  `naissance_nom_acheminement` VARCHAR(50) NULL COMMENT '出生送达名称',
  `naissance_nom_lieu_dit` VARCHAR(50) NULL COMMENT '出生俗称地点名称',
  `naissance_lieu_dit` BIGINT NULL COMMENT '出生俗称地点',
  `naissance_lieu_dit_o_n` TINYINT NULL COMMENT '是否为出生俗称地点',
  `naissance_secteur_naissance` VARCHAR(6) NULL COMMENT '出生区域',
  `naissance_code_postal` VARCHAR(5) NULL COMMENT '出生邮政编码',
  `adresse_type` VARCHAR(3) NULL COMMENT '地址类型',
  `adresse_pays` VARCHAR(3) NULL COMMENT '地址国家',
  `adresse_normee` BIGINT NULL COMMENT '标准化地址',
  `auxiliaire_adresse_1` VARCHAR(50) NULL COMMENT '辅助地址1',
  `auxiliaire_adresse_2` VARCHAR(50) NULL COMMENT '辅助地址2',
  `adresse_num_voie` VARCHAR(10) NULL COMMENT '街道门牌号',
  `adresse_cplt_num_voie` VARCHAR(50) NULL COMMENT '街道门牌号补充',
  `adresse_lib_voie` VARCHAR(50) NULL COMMENT '街道名称',
  `adresse_nom_acheminement` VARCHAR(50) NULL COMMENT '送达名称',
  `adresse_nom_lieu_dit` VARCHAR(50) NULL COMMENT '俗称地点名称',
  `adresse_lieu_dit` BIGINT NULL COMMENT '俗称地点',
  `adresse_lieu` VARCHAR(50) NULL COMMENT '地址地点',
  `adresse_cplt_lieu` VARCHAR(50) NULL COMMENT '地址地点补充',
  `adresse_code_postal` VARCHAR(5) NULL COMMENT '地址邮政编码',
  `adresse_reference` VARCHAR(30) NULL COMMENT '地址参考',
  `collectivite_employeur` VARCHAR(9) NULL COMMENT '雇主集体',
  `collectivite_num_siret_employeur` VARCHAR(20) NULL COMMENT '雇主集体SIRET编号',
  `collectivite_college` VARCHAR(3) NULL COMMENT '集体学院',
  `collectivite_matricule_salarie` VARCHAR(20) NULL COMMENT '集体员工登记号',
  `collectivite_service` VARCHAR(20) NULL COMMENT '集体服务',
  `collectivite_fonction` VARCHAR(100) NULL COMMENT '集体职能',
  `collectivite_profession` VARCHAR(6) NULL COMMENT '集体职业',
  `payeur_num_secu` VARCHAR(13) NULL COMMENT '支付者社保号码',
  `statut_mutation` TINYINT NULL COMMENT '变动状态',
  `statut_cmr` TINYINT NULL COMMENT 'CMR状态',
  `date_maj_cmr` DATE NULL COMMENT 'CMR更新日期',
  `flux_validation_externe_aller` BIGINT NULL COMMENT '外部验证流出流量',
  `flux_validation_externe_retour` BIGINT NULL COMMENT '外部验证流入流量',
  `flux_population` BIGINT NULL COMMENT '人口流量',
  `flux_mutation` BIGINT NULL COMMENT '变动流量',
  `flux_cmr` BIGINT NULL COMMENT 'CMR流量',
  `flux_difaff` BIGINT NULL COMMENT '参保信息扩散流量',
  `statut_conformite` TINYINT NULL COMMENT '合规状态',
  `statut_cotisations` TINYINT NULL COMMENT '缴费状态',
  `statut_cotisations_externes` TINYINT NULL COMMENT '外部缴费状态',
  `date_reg` DATETIME NULL COMMENT '登记日期',
  `user_reg` BIGINT NULL COMMENT '登记用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户',
  `statut_difpop` BIGINT NULL COMMENT '人口扩散状态',
  `statut_sms_immatriculation` TINYINT NULL COMMENT '短信登记状态'
) ENGINE=OLAP
UNIQUE KEY(`num_secu`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`num_secu`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_ecmu_assures_cotisations_solde definition

CREATE TABLE `ods_user_cnam_ecmu_assures_cotisations_solde` (
  `annee` VARCHAR(4) NULL COMMENT '年份',
  `mois` VARCHAR(2) NULL COMMENT '月份',
  `num_secu` VARCHAR(13) NULL COMMENT '社保编号',
  `solde` DECIMAL(38, 0) NULL COMMENT '余额',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `statut_sms` DECIMAL(38, 0) NULL COMMENT '短信状态'
) ENGINE=OLAP
UNIQUE KEY(`annee`, `mois`, `num_secu`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`annee`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_ecmu_collectivites definition

CREATE TABLE `ods_user_cnam_ecmu_collectivites` (
  `code` VARCHAR(9) NULL COMMENT '机构代码',
  `raison_sociale` VARCHAR(200) NULL COMMENT '机构名称',
  `collectivite_mere` VARCHAR(9) NULL COMMENT '上级机构代码',
  `date_entree` DATE NULL COMMENT '入驻日期',
  `date_sortie` DATE NULL COMMENT '退出日期',
  `abrege` VARCHAR(3) NULL COMMENT '简称',
  `forme_juridique` VARCHAR(3) NULL COMMENT '法律形式',
  `nomenclature_activite` VARCHAR(6) NULL COMMENT '活动分类',
  `convention_collective` VARCHAR(6) NULL COMMENT '集体协议',
  `type` VARCHAR(3) NULL COMMENT '类型',
  `num_siret` VARCHAR(20) NULL COMMENT 'SIRET编号',
  `reference_collectivite` VARCHAR(20) NULL COMMENT '机构参考编号',
  `effectif` DECIMAL(10, 0) NULL COMMENT '员工数量',
  `date_effectif` DATE NULL COMMENT '员工数量日期',
  `adresse_geographique` VARCHAR(200) NULL COMMENT '地理地址',
  `cplt_adresse_geographique` VARCHAR(32) NULL COMMENT '地址补充',
  `commune` VARCHAR(32) NULL COMMENT '城市',
  `lieu_dit` DECIMAL(10, 0) NULL COMMENT '地点编号',
  `village_quartier` VARCHAR(38) NULL COMMENT '街区',
  `adresse_postale` VARCHAR(38) NULL COMMENT '邮政地址',
  `telephone` VARCHAR(50) NULL COMMENT '电话',
  `fax` VARCHAR(8) NULL COMMENT '传真',
  `email` VARCHAR(100) NULL COMMENT '邮箱',
  `mot_de_passe` TEXT NULL COMMENT '密码',
  `code_ogd_cotisations` VARCHAR(8) NULL COMMENT '缴费OGD代码',
  `code_ogd_prestations` VARCHAR(8) NULL COMMENT '福利OGD代码',
  `code_assurance` VARCHAR(3) NULL COMMENT '保险代码',
  `active` DECIMAL(10, 0) NULL DEFAULT "1" COMMENT '是否活跃',
  `point_focal` VARCHAR(50) NULL COMMENT '联系人',
  `mutation` DECIMAL(1, 0) NULL COMMENT '变更标志',
  `activation` DECIMAL(1, 0) NULL DEFAULT "0" COMMENT '激活标志',
  `logo` TEXT NULL COMMENT 'LOGO',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` DECIMAL(10, 0) NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` DECIMAL(10, 0) NULL COMMENT '编辑用户',
  `code_agence` VARCHAR(100) NULL COMMENT '代理代码',
  `nom_agence` VARCHAR(100) NULL COMMENT '代理名称',
  `libelle_activite` VARCHAR(200) NULL COMMENT '活动描述',
  `date_debut_activite` DATE NULL COMMENT '活动开始日期',
  `date_immatriculation` DATE NULL COMMENT '注册日期',
  `code_dernier_motif` VARCHAR(6) NULL COMMENT '最后原因代码',
  `libelle_dernier_motif` VARCHAR(200) NULL COMMENT '最后原因描述',
  `date_dernier_motif` DATE NULL COMMENT '最后原因日期'
) ENGINE=OLAP
UNIQUE KEY(`code`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`code`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_ecmu_ref_etablissement_sante definition

CREATE TABLE `ods_user_cnam_ecmu_ref_etablissement_sante` (
  `date_creation` DATE NULL COMMENT '创建日期',
  `date_mise_a_jour` DATE NULL COMMENT '更新日期',
  `raison_sociale` VARCHAR(100) NULL COMMENT '机构名称',
  `inp` VARCHAR(9) NULL COMMENT '机构标识代码',
  `categorie_professionnelle` VARCHAR(100) NULL COMMENT '职业类别',
  `ordre` VARCHAR(50) NULL COMMENT '行业协会',
  `num_ordre` VARCHAR(20) NULL COMMENT '协会编号',
  `num_sgg` VARCHAR(20) NULL COMMENT 'SGG编号',
  `date_sgg` DATE NULL COMMENT 'SGG日期',
  `date_inscription` DATE NULL COMMENT '注册日期',
  `num_immatriculation` VARCHAR(15) NULL COMMENT '登记编号',
  `num_patente` VARCHAR(20) NULL COMMENT '营业执照编号',
  `statut_juridique` VARCHAR(100) NULL COMMENT '法律状态',
  `entite_mere` VARCHAR(100) NULL COMMENT '上级实体',
  `activite` VARCHAR(100) NULL COMMENT '活动内容',
  `secteur_activite` VARCHAR(10) NULL COMMENT '活动领域',
  `num_voie` DECIMAL(10, 0) NULL COMMENT '街道编号',
  `nature_voie` VARCHAR(50) NULL COMMENT '街道类型',
  `bistq` VARCHAR(30) NULL COMMENT '街道标识',
  `libelle_voie` VARCHAR(50) NULL COMMENT '街道名称',
  `adresse_postale` VARCHAR(100) NULL COMMENT '邮政地址',
  `adresse_geographique` VARCHAR(100) NULL COMMENT '地理地址',
  `ville` VARCHAR(100) NULL COMMENT '城市',
  `code_postal` VARCHAR(5) NULL COMMENT '邮政编码',
  `region` VARCHAR(100) NULL COMMENT '地区',
  `departement` VARCHAR(100) NULL COMMENT '省',
  `telephone` VARCHAR(15) NULL COMMENT '电话',
  `fax` VARCHAR(15) NULL COMMENT '传真',
  `email` VARCHAR(128) NULL COMMENT '电子邮箱',
  `inp_responsable` VARCHAR(9) NULL COMMENT '负责人机构标识',
  `nom_responsable` VARCHAR(50) NULL COMMENT '负责人姓名',
  `prenom_responsable` VARCHAR(100) NULL COMMENT '负责人名',
  `nationalite` VARCHAR(3) NULL COMMENT '国籍',
  `libelle_specialite` VARCHAR(100) NULL COMMENT '专业描述',
  `code_convention` VARCHAR(5) NULL COMMENT '协议代码',
  `libelle_convention` VARCHAR(30) NULL COMMENT '协议名称',
  `date_debut_conv` DATE NULL COMMENT '协议开始日期',
  `date_fin_conv` DATE NULL COMMENT '协议结束日期',
  `motif_fin_convention` VARCHAR(100) NULL COMMENT '协议终止原因',
  `date_debut_radiation` DATE NULL COMMENT '注销开始日期',
  `date_fin_radiation` DATE NULL COMMENT '注销结束日期',
  `motif_radiation` VARCHAR(100) NULL COMMENT '注销原因',
  `date_debut_susp` DATE NULL COMMENT '暂停开始日期',
  `date_fin_susp` DATE NULL COMMENT '暂停结束日期',
  `motif_suspension` VARCHAR(100) NULL COMMENT '暂停原因',
  `reseau` DECIMAL(1, 0) NULL COMMENT '网络标识',
  `longit` VARCHAR(20) NULL COMMENT '经度',
  `latit` VARCHAR(20) NULL COMMENT '纬度',
  `pharmacie` DECIMAL(10, 0) NULL COMMENT '药房标识',
  `niveau_sanitaire` DECIMAL(10, 0) NULL COMMENT '卫生等级',
  `date_reg` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `user_reg` DECIMAL(10, 0) NULL COMMENT '创建用户',
  `date_edit` DATETIME NULL COMMENT '记录修改时间',
  `user_edit` DECIMAL(10, 0) NULL COMMENT '修改用户',
  `statut_flux` VARCHAR(1) NULL DEFAULT "0" COMMENT '数据流状态',
  `fichier_num` VARCHAR(10) NULL COMMENT '文件编号',
  `telephone_2` VARCHAR(20) NULL COMMENT '备用电话',
  `village` VARCHAR(100) NULL COMMENT '村庄',
  `type_ets` VARCHAR(15) NULL COMMENT '机构类型'
) ENGINE=OLAP
DUPLICATE KEY(`date_creation`, `date_mise_a_jour`, `raison_sociale`, `inp`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`date_creation`, `date_mise_a_jour`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_fs definition

CREATE TABLE `ods_user_cnam_fs` (
  `feuille` DECIMAL(10, 0) NULL COMMENT '表单编号',
  `type_feuille` VARCHAR(3) NULL COMMENT '表单类型',
  `date_soins` DATE NULL COMMENT '诊疗日期',
  `num_ogd` VARCHAR(8) NULL COMMENT 'OGD编号',
  `nom_ogd` VARCHAR(30) NULL COMMENT 'OGD名称',
  `num_fs_initiale` VARCHAR(10) NULL COMMENT '初始表单编号',
  `num_transaction` VARCHAR(15) NULL COMMENT '交易编号',
  `num_ep_cnam` VARCHAR(15) NULL COMMENT 'CNAM电子凭证编号',
  `num_ep_ac` VARCHAR(15) NULL COMMENT 'AC电子凭证编号',
  `code_csp` VARCHAR(3) NULL COMMENT '职业类别代码',
  `num_secu` VARCHAR(13) NULL COMMENT '社保编号',
  `nom` VARCHAR(30) NULL COMMENT '姓氏',
  `prenom` VARCHAR(50) NULL COMMENT '名字',
  `date_naissance` DATE NULL COMMENT '出生日期',
  `genre` VARCHAR(1) NULL COMMENT '性别',
  `etablissement` VARCHAR(11) NULL COMMENT '机构编号',
  `nom_ets` VARCHAR(100) NULL COMMENT '机构名称',
  `type_ets` VARCHAR(3) NULL COMMENT '机构类型',
  `autre_type_ets` VARCHAR(255) NULL COMMENT '其他机构类型',
  `info_complementaire` VARCHAR(4) NULL COMMENT '补充信息',
  `autre_info_complementaire` VARCHAR(100) NULL COMMENT '其他补充信息',
  `num_imm_vehicule` VARCHAR(10) NULL COMMENT '车辆牌照',
  `date_accident` DATE NULL COMMENT '事故日期',
  `prog_special` VARCHAR(4) NULL COMMENT '特殊程序',
  `affection1` VARCHAR(3) NULL COMMENT '疾病1代码',
  `affection2` VARCHAR(3) NULL COMMENT '疾病2代码',
  `date_fin` DATE NULL COMMENT '结束日期',
  `motif_fin` VARCHAR(3) NULL COMMENT '结束原因',
  `motif_annulation` TEXT NULL COMMENT '取消原因',
  `ps` VARCHAR(9) NULL COMMENT '医疗人员编号',
  `code_specialite` VARCHAR(2) NULL COMMENT '专业代码',
  `num_recu` VARCHAR(15) NULL COMMENT '收据编号',
  `num_decompte` DECIMAL(10, 0) NULL COMMENT '账单编号',
  `num_bordereau` DECIMAL(10, 0) NULL COMMENT '清单编号',
  `statut_bordereau` DECIMAL(1, 0) NULL DEFAULT "0" COMMENT '清单状态',
  `statut` VARCHAR(1) NULL COMMENT '状态',
  `deca_num` DECIMAL(10, 0) NULL COMMENT 'DECA编号',
  `decliq_num` DECIMAL(10, 0) NULL COMMENT 'DECLIQ编号',
  `decret_num` DECIMAL(10, 0) NULL COMMENT '法令编号',
  `decpai_num` DECIMAL(10, 0) NULL COMMENT '付款通知编号',
  `decpai_date` DATE NULL COMMENT '付款通知日期',
  `date_reg` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `user_reg` DECIMAL(10, 0) NULL COMMENT '创建用户',
  `date_edit` DATETIME NULL COMMENT '记录修改时间',
  `user_edit` DECIMAL(10, 0) NULL COMMENT '修改用户',
  `admin_edit` DECIMAL(10, 0) NULL COMMENT '管理员修改标识',
  `statut_finance` DECIMAL(38, 0) NULL DEFAULT "0" COMMENT '财务状态',
  `decliq_date` DATE NULL COMMENT 'DECLIQ日期',
  `decret_date` DATE NULL COMMENT '法令日期',
  `lien_archivage` VARCHAR(100) NULL COMMENT '归档链接',
  `code_rejet` VARCHAR(3) NULL COMMENT '拒绝代码',
  `code_ogd_affiliation` VARCHAR(8) NULL COMMENT '隶属OGD代码',
  `date_reception` DATE NULL COMMENT '接收日期',
  `date_liquidation` DATE NULL COMMENT '清算日期',
  `date_deca` DATE NULL COMMENT 'DECA日期',
  `regime_code` VARCHAR(3) NULL COMMENT '制度代码',
  `num_matricule_ac` VARCHAR(20) NULL COMMENT 'AC登记号'
) ENGINE=OLAP
UNIQUE KEY(`feuille`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`feuille`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_fs_acte definition

CREATE TABLE `ods_user_cnam_fs_acte` (
  `feuille` VARCHAR(15) NOT NULL COMMENT '表单',
  `code` VARCHAR(15) NOT NULL COMMENT '代码',
  `num_dent` BIGINT NOT NULL COMMENT '牙齿编号',
  `type` VARCHAR(1) NULL COMMENT '类型',
  `debut` DATE NULL COMMENT '开始日期',
  `fin` DATE NULL COMMENT '结束日期',
  `quantite` BIGINT NULL COMMENT '数量',
  `quantite_prescrite` BIGINT NULL COMMENT '处方数量',
  `cotation` BIGINT NULL COMMENT '标价',
  `posologie` VARCHAR(100) NULL COMMENT '用药说明',
  `duree` VARCHAR(15) NULL COMMENT '持续时间',
  `montant` BIGINT NULL COMMENT '金额',
  `pourcentage` BIGINT NULL COMMENT '百分比',
  `motif_rejet` VARCHAR(3) NULL COMMENT '拒绝原因',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` BIGINT NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户',
  `part_ro` DECIMAL(10, 2) NULL COMMENT 'RO部分',
  `part_rc` DECIMAL(10, 2) NULL COMMENT 'RC部分',
  `part_assure` DECIMAL(10, 2) NULL COMMENT '投保人部分',
  `montant_base_ac` DECIMAL(10, 2) NULL COMMENT 'AC基础金额',
  `montant_base` DECIMAL(10, 2) NULL COMMENT '基础金额',
  `taux_ro` VARCHAR(3) NULL COMMENT 'RO比率',
  `taux_rc` VARCHAR(3) NULL COMMENT 'RC比率'
) ENGINE=OLAP
UNIQUE KEY(`feuille`, `code`, `num_dent`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`feuille`, `code`, `num_dent`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_ogd_affiliation_cotisations definition

CREATE TABLE `ods_user_cnam_ogd_affiliation_cotisations` (
  `annee` VARCHAR(4) NOT NULL COMMENT '年份',
  `mois` VARCHAR(2) NOT NULL COMMENT '月份',
  `id_population` VARCHAR(100) NOT NULL COMMENT '人群ID',
  `beneficiaire_num_secu` VARCHAR(13) NULL COMMENT '受益人社保号',
  `code_ogd` VARCHAR(8) NULL COMMENT 'OGD代码',
  `code_collectivite` VARCHAR(30) NULL COMMENT '集体代码',
  `payeur_num_secu` VARCHAR(13) NULL COMMENT '付款人社保号',
  `statut` VARCHAR(1) NULL COMMENT '状态',
  `date_reg` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册日期',
  `user_reg` VARCHAR(20) NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` VARCHAR(100) NULL COMMENT '编辑用户',
  `id_declaration` VARCHAR(100) NULL COMMENT '申报ID',
  `id_paiement` VARCHAR(100) NULL COMMENT '支付ID',
  `admin_reg` VARCHAR(20) NULL COMMENT '管理员注册',
  `admin_edit` VARCHAR(20) NULL COMMENT '管理员编辑',
  `statut_generation` BIGINT NULL COMMENT '生成状态',
  `numero_cotisation_ogd` VARCHAR(100) NULL COMMENT 'OGD缴费编号',
  `statut_transfert` INT NULL DEFAULT "0" COMMENT '转移状态'
) ENGINE=OLAP
UNIQUE KEY(`annee`, `mois`, `id_population`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`annee`, `mois`, `id_population`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_ogd_affiliation_paiements definition

CREATE TABLE `ods_user_cnam_ogd_affiliation_paiements` (
  `id_paiement` BIGINT NULL COMMENT '支付ID',
  `code_ogd` VARCHAR(8) NULL COMMENT 'OGD代码',
  `code_collectivite` VARCHAR(9) NULL COMMENT '集体代码',
  `mois` VARCHAR(2) NULL COMMENT '月份',
  `annee` VARCHAR(4) NULL COMMENT '年份',
  `type_paiement` VARCHAR(10) NULL COMMENT '支付类型',
  `code_banque` VARCHAR(10) NULL COMMENT '银行代码',
  `reference` VARCHAR(50) NULL COMMENT '参考编号',
  `numero_compte` VARCHAR(20) NULL COMMENT '账户号码',
  `montant_paiement` VARCHAR(10) NULL COMMENT '支付金额',
  `date_emission` DATE NULL COMMENT '发放日期',
  `date_reception` DATE NULL COMMENT '接收日期',
  `raison_sociale` VARCHAR(200) NULL COMMENT '公司名称',
  `libelle_banque` VARCHAR(200) NULL COMMENT '银行名称',
  `num_fichier` BIGINT NULL COMMENT '文件编号',
  `periodicite` VARCHAR(1) NULL COMMENT '周期',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` BIGINT NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户',
  `statut_generation` INT NULL COMMENT '生成状态'
) ENGINE=OLAP
UNIQUE KEY(`id_paiement`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`id_paiement`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_terminaux definition

CREATE TABLE `ods_user_cnam_terminaux` (
  `terminal` VARCHAR(15) NULL COMMENT '终端标识',
  `etablissement` VARCHAR(9) NULL COMMENT '机构标识',
  `id` BIGINT NULL COMMENT '自增ID',
  `numero_telephone` VARCHAR(15) NULL COMMENT '电话号码',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` BIGINT NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户',
  `terminal_type` VARCHAR(100) NULL COMMENT '终端类型'
) ENGINE=OLAP
UNIQUE KEY(`terminal`, `etablissement`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`terminal`, `etablissement`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_terminaux_historique_deploiement definition

CREATE TABLE `ods_user_cnam_terminaux_historique_deploiement` (
  `terminal` VARCHAR(15) NULL COMMENT '终端标识',
  `code_ets` VARCHAR(9) NULL COMMENT '机构代码',
  `date_debut` DATETIME NULL COMMENT '开始日期',
  `date_fin` DATETIME NULL COMMENT '结束日期',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` BIGINT NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户'
) ENGINE=OLAP
UNIQUE KEY(`terminal`, `code_ets`, `date_debut`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`terminal`, `code_ets`, `date_debut`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);


-- ods.ods_user_cnam_utilisateurs definition

CREATE TABLE `ods_user_cnam_utilisateurs` (
  `id_utilisateur` BIGINT NULL COMMENT '用户ID',
  `num_secu` VARCHAR(13) NULL COMMENT '社保号',
  `code_dcs` VARCHAR(8) NULL COMMENT 'DCS代码',
  `code_agent` VARCHAR(13) NULL COMMENT '代理代码',
  `code_ps` VARCHAR(13) NULL COMMENT 'PS代码',
  `type_utilisateur` VARCHAR(4) NULL COMMENT '用户类型',
  `code_ogd_p` VARCHAR(8) NULL COMMENT 'OGD代码',
  `code_collectivite` VARCHAR(9) NULL COMMENT '集体代码',
  `code_mutuelle` VARCHAR(3) NULL COMMENT '互助会代码',
  `login` VARCHAR(50) NULL COMMENT '登录名',
  `mot_de_passe` VARCHAR(2000) NULL COMMENT '密码',
  `mdp_actif` TINYINT NULL DEFAULT "1" COMMENT '密码激活状态',
  `nom` VARCHAR(50) NULL COMMENT '姓氏',
  `prenom` VARCHAR(50) NULL COMMENT '名字',
  `email` VARCHAR(180) NULL COMMENT '邮箱',
  `telephone` VARCHAR(20) NULL COMMENT '电话',
  `actif` TINYINT NULL COMMENT '激活状态',
  `voucher` VARCHAR(2000) NULL COMMENT '凭证',
  `profil` TEXT NULL COMMENT '配置文件',
  `mode_degrade` BIGINT NULL COMMENT '降级模式',
  `fse` VARCHAR(50) NULL COMMENT 'FSE标识',
  `image` VARCHAR(255) NULL COMMENT '图像路径',
  `derniere_connexion` DATETIME NULL COMMENT '最后登录时间',
  `date_reg` DATETIME NULL COMMENT '注册日期',
  `user_reg` BIGINT NULL COMMENT '注册用户',
  `date_edit` DATETIME NULL COMMENT '编辑日期',
  `user_edit` BIGINT NULL COMMENT '编辑用户'
) ENGINE=OLAP
UNIQUE KEY(`id_utilisateur`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`id_utilisateur`) BUCKETS 10
PROPERTIES (
    "replication_num" = "2"
);
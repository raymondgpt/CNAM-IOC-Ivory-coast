-- dim.dim_country_district definition

CREATE TABLE `dim_country_district` (
  `name` VARCHAR(255) NULL,
  `geo_name` VARCHAR(255) NULL,
  `district_type` VARCHAR(255) NULL,
  `etl_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=OLAP
DUPLICATE KEY(`name`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`name`) BUCKETS 3
PROPERTIES (
    "replication_num" = "3"
);


INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('ABIDJAN 1','ABIDJAN','region','2025-06-11 23:17:11'),
	 ('ABIDJAN 2','ABIDJAN','region','2025-06-11 23:17:39'),
	 ('BAFING','BAFING','region','2025-05-28 22:20:16'),
	 ('BAGOUE','LA BAGOUE','region','2025-05-28 22:21:41'),
	 ('BERE','BERE','region','2025-11-07 23:36:56'),
	 ('BOUNKANI','BOUNKANI','region','2025-11-07 23:36:56'),
	 ('DISTRICT D''ABIDJAN','ABIDJAN','region','2025-05-25 17:36:49'),
	 ('DISTRICT DE YAMOUSSOUKRO','YAMOUSSOUKRO','region','2025-05-25 17:29:02'),
	 ('GOH','GOH','region','2025-11-07 23:36:56'),
	 ('GRANDS PONTS','GRANDS PONTS','region','2025-11-07 23:36:56');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('GUEMON','GUEMON','region','2025-11-07 23:36:56'),
	 ('HAUT-SASSANDRA','HAUT-SASSANDRA','region','2025-11-07 23:36:56'),
	 ('LA BAGOUE','LA BAGOUE','region','2025-11-07 23:36:56'),
	 ('LA BAGOUE','LA BAGOUE','region','2025-11-07 23:36:56'),
	 ('LIFFOU','LIFFOU','region','2025-11-07 23:43:49'),
	 ('LINDENIE-DJUABLIN','LINDENIE-DJUABLIN','region','2025-11-07 23:44:30'),
	 ('MORONOU','MORONOU','region','2025-11-07 23:36:56'),
	 ('NZI','NZI','region','2025-11-07 23:45:11'),
	 ('REGION DE L AGNEBY-TIASSA','LAGNEBY-TIASSA','region','2025-05-25 17:29:00'),
	 ('REGION DE LA BAGOUE','LA BAGOUE','region','2025-05-25 17:28:59');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('REGION DE LA MARAHOUE','LA MARAHOUE','region','2025-05-25 17:28:59'),
	 ('REGION DE LIFFOU','LIFFOU','region','2025-05-29 22:28:51'),
	 ('REGION DE LIFFOU  ','LIFFOU','region','2025-05-25 18:00:07'),
	 ('REGION DE LINDENIE-DJUABLIN','LINDENIE-DJUABLIN','region','2025-05-29 22:24:54'),
	 ('REGION DE SAN PEDRO','SAN PEDRO','region','2025-05-25 17:29:00'),
	 ('REGION DU BAFING','BAFING','region','2025-05-25 17:28:35'),
	 ('REGION DU GONTOUGO','GONTOUGO','region','2025-05-25 17:28:59'),
	 ('REGION DU GUEMON','GUEMON','region','2025-05-25 17:28:59'),
	 ('REGION DU HAMBOL','HAMBOL','region','2025-05-25 17:28:59'),
	 ('REGION DU LOH-DJIBOUA','LOH-DJIBOUA','region','2025-05-25 17:29:00');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('REGION DU NZI','NZI','region','2025-05-29 22:23:40'),
	 ('REGION DU PORO','PORO','region','2025-05-25 17:29:00'),
	 ('REGION DU SUD-COMOE','SUD-COMOE','region','2025-05-25 17:29:00'),
	 ('SAN PEDRO','SAN PEDRO','region','2025-11-07 23:36:56'),
	 ('TONKPI','TONKPI','region','2025-11-07 23:36:56'),
	 ('YAMOUSSOUKRO','YAMOUSSOUKRO','region','2025-11-07 23:36:56'),
	 ('AGNEBY-TIASSA','LAGNEBY-TIASSA','region','2025-05-28 22:19:01'),
	 ('BELIER','BELIER','region','2025-06-11 23:18:49'),
	 ('CAVALLY','CAVALLY','region','2025-11-07 23:36:56'),
	 ('GBOKLE','GBOKLE','region','2025-11-07 23:36:56');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('GONTOUGO','GONTOUGO','region','2025-11-07 23:36:56'),
	 ('KABADOUGOU','KABADOUGOU','region','2025-11-07 23:36:56'),
	 ('LA ME','LA ME','region','2025-11-07 23:36:56'),
	 ('LA NAWA','LA NAWA','region','2025-11-07 23:36:56'),
	 ('REGION DE GBEKE','GBEKE','region','2025-05-25 17:28:59'),
	 ('REGION DE L INDENIE-DJUABLIN','LINDENIE-DJUABLIN','region','2025-05-25 17:29:00'),
	 ('REGION DE LA ME','LA ME','region','2025-05-25 17:28:59'),
	 ('REGION DE LA NAWA','LA NAWA','region','2025-05-25 17:29:00'),
	 ('REGION DE LAGNEBY-TIASSA','LAGNEBY-TIASSA','region','2025-05-25 17:59:59'),
	 ('REGION DU BERE','BERE','region','2025-05-25 17:28:51');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('REGION DU CAVALLY','CAVALLY','region','2025-05-25 17:28:58'),
	 ('REGION DU FOLON','FOLON','region','2025-05-25 17:28:58'),
	 ('REGION DU GBOKLE','GBOKLE','region','2025-05-25 17:28:59'),
	 ('REGION DU GOH','GOH','region','2025-05-25 17:28:59'),
	 ('REGION DU HAUT-SASSANDRA','HAUT-SASSANDRA','region','2025-05-25 17:28:59'),
	 ('REGION DU KABADOUGOU','KABADOUGOU','region','2025-05-25 17:28:59'),
	 ('REGION DU N ZI','NZI','region','2025-05-25 17:29:00'),
	 ('REGION DU TONKPI','TONKPI','region','2025-05-25 17:29:01'),
	 ('TCHOLOGO','TCHOLOGO','region','2025-11-07 23:36:56'),
	 ('WORODOUGOU','WORODOUGOU','region','2025-11-07 23:36:56');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('ABIDJAN','ABIDJAN','region','2025-05-28 22:18:21'),
	 ('FOLON','FOLON','region','2025-11-07 23:36:56'),
	 ('GBEKE','GBEKE','region','2025-11-07 23:36:56'),
	 ('HAMBOL','HAMBOL','region','2025-11-07 23:36:56'),
	 ('LA MARAHOUE','LA MARAHOUE','region','2025-11-07 23:36:56'),
	 ('LAGNEBY-TIASSA','LAGNEBY-TIASSA','region','2025-11-07 23:36:56'),
	 ('LAGNEBY-TIASSA','LAGNEBY-TIASSA','region','2025-11-07 23:36:56'),
	 ('LAGNEBY-TIASSA','LAGNEBY-TIASSA','region','2025-11-07 23:36:56'),
	 ('LOH-DJIBOUA','LOH-DJIBOUA','region','2025-11-07 23:36:56'),
	 ('PORO','PORO','region','2025-11-07 23:36:56');
INSERT INTO dim.dim_country_district (name,geo_name,district_type,etl_time) VALUES
	 ('REGION DE L IFFOU  ','LIFFOU','region','2025-05-25 17:29:00'),
	 ('REGION DES GRANDS PONTS','GRANDS PONTS','region','2025-05-25 17:28:59'),
	 ('REGION DU BELIER','BELIER','region','2025-05-25 17:28:51'),
	 ('REGION DU BOUNKANI','BOUNKANI','region','2025-05-25 17:28:58'),
	 ('REGION DU MORONOU','MORONOU','region','2025-05-25 17:29:00'),
	 ('REGION DU TCHOLOGO','TCHOLOGO','region','2025-05-25 17:29:00'),
	 ('REGION DU WORODOUGOU','WORODOUGOU','region','2025-05-25 17:29:01'),
	 ('SUD-COMOE','SUD-COMOE','region','2025-11-07 23:36:56');

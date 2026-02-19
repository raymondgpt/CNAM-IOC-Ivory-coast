-- dim.dim_country_district definition(把excel表的地区名和地图中的地区名进行对应，多对一的关系)

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
    "replication_num" = "2"
);
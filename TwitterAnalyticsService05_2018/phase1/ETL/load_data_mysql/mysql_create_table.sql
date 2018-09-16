-- step 1 create a database
drop database if exists twitter_db;
create database twitter_db;
alter database twitter_db default character set utf8mb4 collate utf8mb4_bin;
use twitter_db;


-- Step 2 create nouid table (2 columns)
drop table if exists `nouid`;
create table `nouid` (
	`word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`hashtags` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	primary key (word)
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Step 3 load data to nouid table
load data local infile '2.tsv' into table nouid character set utf8mb4 columns terminated by '\t' LINES TERMINATED BY '\n';

-- Step 5 create records table (3 columns)
drop table if exists `records`;
create table `records` (
	`word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`hashtags` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	primary key (word, uid)
)
CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Step 6 load data to records table
load data local infile '3.tsv' into table records character set utf8mb4 columns terminated by '\t' LINES TERMINATED BY '\n';

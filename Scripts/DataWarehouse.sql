/*
=============================================================
CREATE DATABASE AND SCHEMA
=============================================================
Script purposes:
This script will create database name "DataWarehouse", if name of the database exists, 
it is dropped and recreated. Additionally, this script will create three schema within 
the data base name: "bronze", "silver" and "gold".

WARNING
Running this script will delete the exist database name "DataWarehouse".
All the data will be permanently deleted. So, before run this scripts, 
proceed with caution and ensure you have proper backups. 
*/
-- Create database
USE master;
go

-- Drop and recreate "DataWarehouse" database
IF EXISTS (SELECT 1
           FROM  sys.databases
           WHERE NAME = 'DataWarehouse')
  BEGIN
      ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
      DROP DATABASE DataWarehouse;
  END;
go

-- Create database "DataWarehouse"
CREATE DATABASE DataWarehouse;
go

USE DataWarehouse;
go

-- Create Schema
CREATE SCHEMA bronze;
go

CREATE SCHEMA silver;
go

CREATE SCHEMA gold;
go 

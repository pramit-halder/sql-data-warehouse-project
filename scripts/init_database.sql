/*
==============================================
Create Database and Schemas
==============================================

Script Purpose: 
This script creates a new database called "DataWareHouse". If it exists then it drops the existing one
and recreates a new one. Also, this script would create 3 layers of schema.

Warning:
As mentioned, running this script would drop the database(if it existed already. So execute with caution.
*/

Use Master;
Go

If Exists (Select 1 from sys.databases where name = 'DataWareHouse')
Begin
	Alter Database DataWarehouse Set Single_User With Rollback Immediate;
	Drop Database DataWareHouse
End;
Go

-- Create Database
Create Database DataWareHouse;
Go

Use DataWareHouse;
Go

-- Create Schema
Create Schema bronze;
Go
Create Schema silver;
Go
Create Schema gold;
Go

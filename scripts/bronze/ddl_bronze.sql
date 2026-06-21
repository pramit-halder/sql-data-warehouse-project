/*
=======================================
Table Creation Script
=======================================

Purpose:
This Script would result in table creation. To be noted, if the tables already exist then
they would dropped and created again.
*/

-- Naming Convention: <source_system>_<table_name_in_source_system>

If Object_Id('bronze.crm_cust_info', 'U') Is Not Null
	Drop Table bronze.crm_cust_info;
Create Table bronze.crm_cust_info (
	cst_id Int,
	cst_key	NVarchar(50),
	cst_firstname NVarchar(50),
	cst_lastname NVarchar(50),
	cst_marital_status NVarchar(50),	
	cst_gndr NVarchar(50),	
	cst_create_date Date
);
Go

If Object_Id('bronze.crm_prd_info', 'U') Is Not Null
	Drop Table bronze.crm_prd_info;
Create Table bronze.crm_prd_info (
	prd_id	Int,
	prd_key NVarchar(50),
	prd_nm NVarchar(50),
	prd_cost Int,	
	prd_line NVarchar(50),
	prd_start_dt Date,	
	prd_end_dt Date
);
Go

If Object_Id('bronze.crm_sales_details', 'U') Is Not Null
	Drop Table bronze.crm_sales_details;
Create Table bronze.crm_sales_details (
	sls_ord_num	NVarchar(50),
	sls_prd_key	NVarchar(50),
	sls_cust_id	Int,
	sls_order_dt Int,
	sls_ship_dt	Int,
	sls_due_dt Int,
	sls_sales Int,
	sls_quantity Int,
	sls_price Int,
);
Go

If Object_Id('bronze.erp_cust_az12', 'U') Is Not Null
	Drop Table bronze.erp_cust_az12;
Create Table bronze.erp_cust_az12 (
	cid NVarchar(50),
	bdate Date,
	gen NVarchar(50)
);
Go

If Object_Id('bronze.erp_loc_a101', 'U') Is Not Null
	Drop Table bronze.erp_loc_a101;
Create Table bronze.erp_loc_a101 (
	cid NVarchar(50),
	cntry NVarchar(50)
);
Go

If Object_Id('bronze.erp_px_cat_g1v2', 'U') Is Not Null
	Drop Table bronze.erp_px_cat_g1v2;
Create Table bronze.erp_px_cat_g1v2 (
	id NVarchar(50),
	cat NVarchar(50),
	subcat NVarchar(50),
	maintenance NVarchar(50)
);
Go




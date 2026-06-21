/*
=======================================
Stored Procedure for Data Loading in Bronze Layer
=======================================

Purpose:
This procedure truncates the existing data and reloads the data from the CSV files into the existing tables.

Parameters: 
This stored procedure neither accepts any values nor returns.

Usage:
Exec bronze.load_bronze;

*/

Create Or Alter Procedure bronze.load_bronze As 
Begin
	Declare @start_time DateTime, @end_time DateTime, @start_time_batch DateTime, @end_time_batch DateTime;
	Begin Try
		Set @start_time_batch = GetDate();
		Print '================================';
		Print 'Inserting Data into Bronze Layer';
		Print '================================';

		Set @start_time = getDate();
		Print '>>> Truncating crm_cust_info';
		Truncate Table bronze.crm_cust_info;
		Print '>>> Loading Data into crm_cust_info';
		Bulk Insert bronze.crm_cust_info
		From 'C:\Users\prami\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		With (
			FirstRow = 2, -- Since, the first row of csv has the header which is the name of columns
			FieldTerminator = ',', -- Separator for each column
			Tablock -- Blocks the table when data is being inserted
		);
		Set @end_time = getDate();
		Print 'Time Taken: ' + Cast(DateDiff(Second, @start_time, @end_time) As NVarchar(50)) + 'seconds';

		Set @start_time = getDate();
		Print '>>> Truncating crm_prd_info';
		Truncate Table bronze.crm_prd_info;
		Print '>>> Loading Data into crm_prd_info';
		Bulk Insert bronze.crm_prd_info
		From 'C:\Users\prami\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		With (
			FirstRow = 2, -- Since, the first row of csv has the header which is the name of columns
			FieldTerminator = ',', -- Separator for each column
			Tablock -- Blocks the table when data is being inserted
		);
		Set @end_time = getDate();
		Print 'Time Taken: ' + Cast(DateDiff(Second, @start_time, @end_time) As NVarchar(50)) + 'seconds';

		Set @start_time = getDate();
		Print '>>> Truncating crm_sales_details';
		Truncate Table bronze.crm_sales_details;
		Print '>>> Loading Data into crm_sales_details';
		Bulk Insert bronze.crm_sales_details
		From 'C:\Users\prami\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		With (
			FirstRow = 2, -- Since, the first row of csv has the header which is the name of columns
			FieldTerminator = ',', -- Separator for each column
			Tablock -- Blocks the table when data is being inserted
		);
		Set @end_time = getDate();
		Print 'Time Taken: ' + Cast(DateDiff(Second, @start_time, @end_time) As NVarchar(50)) + 'seconds';

		Print '--------------------------------';
		Print 'CRM Data Loaded';
		Print '--------------------------------';

		Set @start_time = getDate();
		Print '>>> Truncating erp_cust_az12';
		Truncate Table bronze.erp_cust_az12;
		Print '>>> Loading Data into erp_cust_az12';
		Bulk Insert bronze.erp_cust_az12
		From 'C:\Users\prami\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		With (
			FirstRow = 2, -- Since, the first row of csv has the header which is the name of columns
			FieldTerminator = ',', -- Separator for each column
			Tablock -- Blocks the table when data is being inserted
		);
		Set @end_time = getDate();
		Print 'Time Taken: ' + Cast(DateDiff(Second, @start_time, @end_time) As NVarchar(50)) + 'seconds';

		Set @start_time = getDate();
		Print '>>> Truncating erp_loc_a101';
		Truncate Table bronze.erp_loc_a101;
		Print '>>> Loading Data into erp_loc_a101';
		Bulk Insert bronze.erp_loc_a101
		From 'C:\Users\prami\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		With (
			FirstRow = 2, -- Since, the first row of csv has the header which is the name of columns
			FieldTerminator = ',', -- Separator for each column
			Tablock -- Blocks the table when data is being inserted
		);
		Set @end_time = getDate();
		Print 'Time Taken: ' + Cast(DateDiff(Second, @start_time, @end_time) As NVarchar(50)) + 'seconds';

		Set @start_time = getDate();
		Print '>>> Truncating erp_px_cat_g1v2';
		Truncate Table bronze.erp_px_cat_g1v2;
		Print '>>> Loading Data into erp_px_cat_g1v2';
		Bulk Insert bronze.erp_px_cat_g1v2
		From 'C:\Users\prami\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		With (
			FirstRow = 2, -- Since, the first row of csv has the header which is the name of columns
			FieldTerminator = ',', -- Separator for each column
			Tablock -- Blocks the table when data is being inserted
		);
		Set @end_time = getDate();
		Print 'Time Taken: ' + Cast(DateDiff(Second, @start_time, @end_time) As NVarchar(50)) + 'seconds';
		Print '--------------------------------';
		Print 'ERP Data Loaded';
		Print '--------------------------------';
		Set @end_time_batch = getDate();
		Print 'Total Time Taken: ' + Cast(DateDiff(Second, @start_time_batch, @end_time_batch) As NVarchar(50)) + 'seconds';
	End Try
	Begin Catch
		Print '================================';
		Print 'Error In Data Loading';
		Print '================================';
	End Catch
End

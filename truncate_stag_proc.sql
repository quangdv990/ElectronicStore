USE [DE_Project_Stag]
GO
/****** Object:  StoredProcedure [project].[truncate_stag]    Script Date: 8/22/2022 1:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [project].[truncate_stag]
as
begin
	truncate table project.Dim_Brand
	truncate table project.Dim_Category
	truncate table project.Dim_City
	truncate table project.Dim_Customer
	truncate table project.Dim_Date
	truncate table project.Dim_Employee
	truncate table project.Dim_Product
	truncate table project.Dim_Source_Online
	truncate table project.Dim_Store
	truncate table project.Fact_SalesOrder
	truncate table project.Fact_Product


end


truncate table project.Brand
truncate table project.Category
truncate table project.City
truncate table project.Customer 
truncate table project.Employee
truncate table project.Store
truncate table project.Product
truncate table project.Order_
Use DE_Project_Stag

CREATE TABLE project.[Dim_Date](
	[OrderDate] [date] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_Employee](
	[EmployeeKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DOB] [date] NULL,
	[HireDate] [date] NULL,
	[IdentityNumber] [nvarchar](50) NULL,
	[StoreKey] [nvarchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_Source_Online](
	[Source_OnlineKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_Customer](
	[CustomerKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_Store](
	[StoreKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CityKey] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_City](
	[CityKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_Product](
	[ProductKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[BrandKey] [nvarchar](50) NULL,
	[CategoryKey] [nvarchar](50) NULL,
	[StandardPrice] [numeric](18, 2) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [project].[Dim_Brand](
	[BrandKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [project].[Dim_Category](
	[CategoryKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO



CREATE TABLE [project].[Fact_SalesOrder](
	[OrderDate] date NOT NULL,
	[Customer_Id] [nvarchar](50) NOT NULL,
	[Employee_Id] [nvarchar](50) NOT NULL,
	[Source_Online_Id] [nvarchar](50) NOT NULL,
	[Revenue] [decimal](18, 2) NOT NULL,
	[RevenueOnline] [decimal](18, 2) NOT NULL,
	[RevenueOffline] [decimal](18, 2) NOT NULL,
	[StandardCost] [decimal](18, 2) NOT NULL,
	[Profit] [decimal](18, 2) NOT NULL,
	[NumberOrder] [int] NOT NULL,
	[NumberOrderOnline] [int] NOT NULL,
	[NumberOrderOffline] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [project].[Fact_Product](
	[OrderDate] date NOT NULL,
	[StoreKey] [nvarchar](50) NOT NULL,
	[ProductKey] [nvarchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[Revenue] [numeric](18, 2) NULL,
 ) ON [PRIMARY]
GO
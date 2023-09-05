USE [DE_Project_Stag]

Create schema project;
GO

CREATE TABLE project.[Brand](
	[Brand_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE project.[Category](
	[Category_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE project.[City](
	[City_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE project.[Customer](
	[Customer_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL,
) ON [PRIMARY]
GO

CREATE TABLE project.[Employee](
	[Employee_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DOB] [date] NULL,
	[HireDate] [date] NULL,
	[IdentityNumber] [nvarchar](50) NULL,
	[Store_Id] [nvarchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE project.[Product](
	[Product_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Brand_Id] [nvarchar](50) NULL,
	[Category_Id] [nvarchar](50) NULL,
	[StandardPrice] [numeric](18, 2) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE project.[Source_Online](
	[Source_Online_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE project.[Store](
	[Store_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[City_Id] [nvarchar](50) NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE project.[Order_Header](
	[Order_Header_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[StandardCost] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[IsOnline] [bit] NOT NULL,
	[Source_Online_Id] [nvarchar](50) NULL,
	[Customer_Id] [nvarchar](50) NULL,
	[Employee_Id] [nvarchar](50) NULL,
	[Store_Id] [nvarchar](50) NULL,
 ) ON [PRIMARY]
GO

CREATE TABLE project.[Order_Detail](
	[Order_Detail_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Product_Id] [nvarchar](50) NULL,
	[Qty] [numeric](8, 0) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Total] [numeric](18, 2) NOT NULL,
	[Order_Header_Id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
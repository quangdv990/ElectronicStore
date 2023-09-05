---------------------SNOWFLAKE SCHEMA------------------

USE [DE_Project_DW]
GO
create schema project;
GO
---------Create year dimesion
CREATE TABLE project.[Dim_Year](
	[YearKey] [nvarchar](4) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Year] PRIMARY KEY CLUSTERED 
(
	[YearKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---- Create month dimension
CREATE TABLE project.[Dim_Month](
	[MonthKey] [nvarchar](6) NOT NULL,
	[YearKey] [nvarchar](4) NOT NULL,
	[Month] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Month] PRIMARY KEY CLUSTERED 
(
	[MonthKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Dim_Month]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Month_Dim_Year] FOREIGN KEY([YearKey])
REFERENCES project.[Dim_Year] ([YearKey])
GO
ALTER TABLE project.[Dim_Month] CHECK CONSTRAINT [FK_Dim_Month_Dim_Year]
GO

---- Create date dimension
CREATE TABLE project.[Dim_Date](
	[DateKey] [nvarchar](8) NOT NULL,
	[MonthKey] [nvarchar](6) NOT NULL,
	[Date] Date not null
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Dim_Date]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Date_Dim_Month] FOREIGN KEY([MonthKey])
REFERENCES project.[Dim_Month] ([MonthKey])
GO

ALTER TABLE project.[Dim_Date] CHECK CONSTRAINT [FK_Dim_Date_Dim_Month]
GO

---

---------Create City dimension
CREATE TABLE project.[Dim_City](
	[CityKey] nvarchar(50),
	[Name] [nvarchar](250) NOT NULL,

 CONSTRAINT [PK_Dim_City] PRIMARY KEY CLUSTERED 
(
	[CityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


---------Create Store dimension
CREATE TABLE project.[Dim_Store](
	[StoreKey] nvarchar(50),
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CityKey] [nvarchar](50) NOT NULL,

 CONSTRAINT [PK_Dim_Store] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Dim_Store]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Store_Dim_City] FOREIGN KEY([CityKey])
REFERENCES project.[Dim_City] ([CityKey])
GO

ALTER TABLE project.[Dim_Store] CHECK CONSTRAINT [FK_Dim_Store_Dim_City]
GO


---------Create Employee dimension
CREATE TABLE project.[Dim_Employee](
	[EmployeeKey] nvarchar(50),
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DOB] [date] NULL,
	[HireDate] [date] NULL,
	[IdentityNumber] [nvarchar](50) NULL,
	[StoreKey] [nvarchar](50) NULL,

 CONSTRAINT [PK_Dim_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Dim_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Employee_Dim_Store] FOREIGN KEY([StoreKey])
REFERENCES project.[Dim_Store] ([StoreKey])
GO

ALTER TABLE project.[Dim_Employee] CHECK CONSTRAINT [FK_Dim_Employee_Dim_Store]
GO



---------Create Customer dimension
CREATE TABLE project.[Dim_Customer](
	[CustomerKey] nvarchar(50),
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL,

 CONSTRAINT [PK_Dim_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


---- Create Category dimension
CREATE TABLE project.[Dim_Category](
	[CategoryKey] nvarchar(50),
	[Name] [nvarchar](250) NOT NULL,

 CONSTRAINT [PK_Dim_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---- Create Brand dimension
CREATE TABLE project.[Dim_Brand](
	[BrandKey] nvarchar(50),
	[Name] [nvarchar](250) NOT NULL,

 CONSTRAINT [PK_Dim_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---- Create Product dimension
CREATE TABLE project.[Dim_Product](
	[ProductKey] nvarchar(50),
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[BrandKey] [nvarchar](50) NULL,
	[CategoryKey] [nvarchar](50) NULL,
	[StandardPrice] [numeric](18, 2) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_Category] FOREIGN KEY([CategoryKey])
REFERENCES project.[Dim_Category] ([CategoryKey])
GO
ALTER TABLE project.[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_Category]
GO

ALTER TABLE project.[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_Brand] FOREIGN KEY([BrandKey])
REFERENCES project.[Dim_Brand] ([BrandKey])
GO
ALTER TABLE project.[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_Brand]
GO

---- Create Source Online dimension
CREATE TABLE project.[Dim_Source_Online](
	[SourceOnlineKey] nvarchar(50),
	[Name] [nvarchar](250) NOT NULL,

 CONSTRAINT [PK_Dim_Source_Online] PRIMARY KEY CLUSTERED 
(
	[SourceOnlineKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-----Create Fact sales order

CREATE TABLE project.[Fact_SalesOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[CustomerKey] [nvarchar](50) NOT NULL,
	[EmployeeKey] [nvarchar](50) NOT NULL,
	[SourceOnlineKey] [nvarchar](50) NOT NULL,
	[Revenue] [decimal](18, 2) NOT NULL,
	[RevenueOnline] [decimal](18, 2) NOT NULL,
	[RevenueOffline] [decimal](18, 2) NOT NULL,
	[StandardCost] [decimal](18, 2) NOT NULL,
	[Profit] [decimal](18, 2) NOT NULL,
	[NumberOrder] int NOT NULL,
	[NumberOrderOnline] int NOT NULL,
	[NumberOrderOffline] int NOT NULL,
 CONSTRAINT [PK_Fact_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES project.[Dim_Date] ([DateKey])
GO

ALTER TABLE project.[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Date]
GO

ALTER TABLE project.[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Employee] FOREIGN KEY([EmployeeKey])
REFERENCES project.[Dim_Employee] ([EmployeeKey])
GO

ALTER TABLE project.[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Employee]
GO

ALTER TABLE project.[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Customer] FOREIGN KEY([CustomerKey])
REFERENCES project.[Dim_Customer] ([CustomerKey])
GO

ALTER TABLE project.[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Customer]
GO


ALTER TABLE project.[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_SourceOnline] FOREIGN KEY([SourceOnlineKey])
REFERENCES project.[Dim_Source_Online] ([SourceOnlineKey])
GO

ALTER TABLE project.[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_SourceOnline]
GO



-----Create Fact product

CREATE TABLE project.[Fact_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[StoreKey] [nvarchar](50) NOT NULL,
	[ProductKey] [nvarchar](50)  NOT NULL,
	[Qty] int NOT NULL
 CONSTRAINT [PK_Fact_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE project.[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES project.[Dim_Date] ([DateKey])
GO

ALTER TABLE project.[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Date]
GO

ALTER TABLE project.[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Product] FOREIGN KEY([ProductKey])
REFERENCES project.[Dim_Product] ([ProductKey])
GO

ALTER TABLE project.[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Product]
GO


ALTER TABLE project.[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Store] FOREIGN KEY([StoreKey])
REFERENCES project.[Dim_Store] ([StoreKey])
GO

ALTER TABLE project.[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Store]
GO
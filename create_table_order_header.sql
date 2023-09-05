USE [DE_Project]
GO

/****** Object:  Table [dbo].[Order_Header]    Script Date: 8/23/2022 10:01:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order_Header](
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
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_Header_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order_Header] ADD  CONSTRAINT [DF_Order_IsOnline]  DEFAULT ((0)) FOR [IsOnline]
GO

ALTER TABLE [dbo].[Order_Header]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO

ALTER TABLE [dbo].[Order_Header] CHECK CONSTRAINT [FK_Order_Customer]
GO

ALTER TABLE [dbo].[Order_Header]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO

ALTER TABLE [dbo].[Order_Header] CHECK CONSTRAINT [FK_Order_Employee]
GO

ALTER TABLE [dbo].[Order_Header]  WITH CHECK ADD  CONSTRAINT [FK_Order_Source_Online] FOREIGN KEY([Source_Online_Id])
REFERENCES [dbo].[Source_Online] ([Source_Online_Id])
GO

ALTER TABLE [dbo].[Order_Header] CHECK CONSTRAINT [FK_Order_Source_Online]
GO

ALTER TABLE [dbo].[Order_Header]  WITH CHECK ADD  CONSTRAINT [FK_Order_Store] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[Store] ([Store_Id])
GO

ALTER TABLE [dbo].[Order_Header] CHECK CONSTRAINT [FK_Order_Store]
GO



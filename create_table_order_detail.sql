USE [DE_Project]
GO

/****** Object:  Table [dbo].[Order_Detail]    Script Date: 8/23/2022 10:01:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order_Detail](
	[Order_Detail_Id] [nvarchar](50) NOT NULL,
	[Product_Id] [nvarchar](50) NULL,
	[Qty] [numeric](8, 0) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Total] [numeric](18, 2) NOT NULL,
	[Order_Header_Id] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[Order_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([Order_Header_Id])
REFERENCES [dbo].[Order_Header] ([Order_Header_Id])
GO

ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO

ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Product_Id])
GO

ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO



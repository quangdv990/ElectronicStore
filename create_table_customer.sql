USE [DE_Project]
GO


CREATE TABLE [dbo].[Customer](
	[Customer_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)
) ON [PRIMARY]
GO



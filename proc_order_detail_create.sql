USE [DE_Project]
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_create]    Script Date: 8/23/2022 10:04:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Order_Detail_create]
(
    @Product_Id nvarchar(50)
    ,@Qty numeric(8,0)
    ,@Price numeric(18,2)
    ,@Total numeric(18,2)
    ,@Order_Header_Id nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Order_Detail
    (
        Order_Detail_Id
        ,Product_Id
        ,Qty
        ,Price
        ,Total
        ,Order_Header_Id
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Product_Id
        ,@Qty
        ,@Price
        ,@Total
        ,@Order_Header_Id
		,GETDATE()
        ,null
    )
end

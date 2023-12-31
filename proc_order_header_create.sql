USE [DE_Project]
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_create]    Script Date: 8/23/2022 10:04:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Order_Header_create]
(
    @Code nvarchar(50)
    ,@OrderDate date
    ,@Total decimal
	,@StandardCost decimal
    ,@Status int
    ,@IsOnline bit
    ,@Source_Online_Id nvarchar(50)
    ,@Customer_Id nvarchar(50)
    ,@Employee_Id nvarchar(50)
    ,@Store_Id nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Order_Header
    (
        Order_Header_Id
        ,Code
        ,OrderDate
        ,Total
		,StandardCost 
        ,Status
        ,IsOnline
        ,Source_Online_Id
        ,Customer_Id
        ,Employee_Id
        ,Store_Id
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Code
        ,@OrderDate
        ,@Total
		,@StandardCost
        ,@Status
        ,@IsOnline
        ,@Source_Online_Id
        ,@Customer_Id
        ,@Employee_Id
        ,@Store_Id
        ,GETDATE()
        ,null
    )
end

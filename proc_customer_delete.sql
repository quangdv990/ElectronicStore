USE [DE_Project]
GO
/****** Object:  StoredProcedure [dbo].[Customer_delete]    Script Date: 8/23/2022 10:00:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Customer_delete]
(
    @Customer_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Customer where Customer_Id=@Customer_Id

end

USE [DE_Project]
GO


ALTER procedure [dbo].[Customer_getbyid]
(
    @Customer_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Customer where Customer_Id=@Customer_Id

end

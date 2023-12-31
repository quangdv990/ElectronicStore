USE [DE_Project]
GO
CREATE procedure [dbo].[Customer_update]
(
    @Customer_Id nvarchar(50)
    ,@Name nvarchar(250)
    ,@Phone nvarchar(50)
)
as
begin
    set nocount on

    update Customer set 
        Name=@Name
        ,Phone=@Phone
        ,UpdatedDate=GetDate()
     where Customer_Id=@Customer_Id
end

USE [DE_Project]

CREATE procedure [dbo].[Customer_create]
(

    @Name nvarchar(250)
    ,@Phone nvarchar(50)
)
as
begin
    set nocount on
    declare @temp nvarchar(50) = lower(newid())

    insert into Customer
    (
        Customer_Id
        ,Name
        ,Phone
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Name
        ,@Phone
		,GETDATE()
        ,null
    )
end


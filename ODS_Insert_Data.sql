Use DE_Project
SET NOCOUNT ON;  

--- insert Order Header 
declare @noOrder int = 500000
declare @orderIndex int = 1
declare @orderCode nvarchar(50)
declare @OrderDate date
declare @isOnline bit 
declare @source_online_id nvarchar(50)
declare @customer_id nvarchar(50)
declare @employee_id nvarchar(50)
declare @store_id nvarchar(50)
declare @fromDate date, @toDate date
declare @days_between int
declare @days_rand int

set @fromDate = '2022-01-01'
set @todate = GetDate()

while (@orderIndex <=@noOrder)
	begin

		set @orderCode = (Select CONCAT('SO', @orderIndex))

		set @days_between = datediff(day,@fromDate,@toDate)
		set @days_rand  = cast(RAND()*10000 as int)  % @days_between
		set @OrderDate = dateadd( day, @days_rand, @fromDate )

		set @isOnline = CAST(ROUND(RAND(),0) AS BIT)
		if (@isOnline = 1)
			set @source_online_id = (Select Top 1 Source_Online_Id from Source_Online order by newId())
		else 
			set @source_online_id = null

		set @customer_id = (Select Top 1 Customer_Id from Customer order by newId())
		Select Top 1 @employee_id= Employee_Id, @store_id = Store_Id from Employee order by newId()

		exec Order_Header_create @orderCode, @OrderDate, 0, 0, 3, @isOnline , @source_online_id, @customer_id, @employee_id, @store_id
		set @orderIndex = @orderIndex + 1
	end
GO
-- select * from Order_Header 
-- select count (*) from Order_Header  

--- insert Order Detail

declare @minProduct int = 1
declare @maxProduct int = 5
declare @minQty int = 1
declare @maxQty int = 10
declare @noProduct int
declare @prodIndex int = 1
declare @qty int
declare @price numeric
declare @standardPrice numeric
declare @total numeric
declare @totalAll numeric
declare @standardCost numeric
declare @standardCostAll numeric
declare @product_Id nvarchar(50)
declare @Order_Header_Id nvarchar(50)

DECLARE header_cursor CURSOR FOR SELECT Order_Header_Id from Order_Header where Total = 0;
OPEN header_cursor  
FETCH NEXT FROM header_cursor INTO @Order_Header_Id
WHILE @@FETCH_STATUS = 0  
  begin
	set @prodIndex = 1
	set @totalAll = 0
	set @standardCostAll = 0
	set @noProduct = (SELECT FLOOR(RAND()*(@maxProduct-@minProduct+1))+ @minProduct);
	while (@prodIndex <= @noProduct)
		begin
			set @Product_Id = (Select Top 1 Product_Id from Product order by newId())
			Select Top 1 @Product_Id= Product_Id, @price = Price,@StandardPrice = StandardPrice  from Product order by newId()
			set @qty = (SELECT FLOOR(RAND()*(@maxQty-@minQty+1))+ @minQty);
			set @total = @qty * @price
			set @standardCost = @qty * @standardPrice
			exec Order_Detail_create @Product_Id, @qty, @price , @total, @Order_Header_Id
			set @prodIndex = @prodIndex + 1
			set @totalAll = @totalAll + @total
			set @standardCostAll = @standardCostAll + @standardCost
			
		end
	update Order_Header set total = @totalAll, StandardCost = @standardCostAll where Order_Header_Id =  @Order_Header_Id
	FETCH NEXT FROM header_cursor INTO @Order_Header_Id
  end
CLOSE header_cursor;  
DEALLOCATE header_cursor;
GO
-- select * from Order_Detail 
-- select count (*) from Order_Detail  

select newID()
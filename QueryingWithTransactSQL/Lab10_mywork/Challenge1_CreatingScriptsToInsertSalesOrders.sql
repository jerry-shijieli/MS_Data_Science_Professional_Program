-- Write code to insert an order header
declare @OrderDate datetime = GETDATE();
declare @DueDate datetime = DATEADD(dd, 7, GETDATE());
declare @CustomerID int = 1;
declare @OrderID int;

set @OrderID = next value for SalesLT.SalesOrderNumber;

insert into SalesLT.SalesOrderHeader (SalesOrderID, OrderDate, DueDate, CustomerID, ShipMethod)
values (@OrderID, @OrderDate, @DueDate, @CustomerID, 'CARGO TRANSPORT 5');

PRINT @OrderID;

-- Write code to insert an order detail
declare @SalesOrderID int;
declare @ProductID int = 760;
declare @Quantity int = 1;
declare @UnitPrice money = 782.99;

set @SalesOrderID = 0;

if exists (select SalesOrderID from SalesLT.SalesOrderDetail where SalesOrderID = @SalesOrderID)
begin
	insert into SalesLT.SalesOrderDetail (SalesOrderID, ProductID, OrderQty, UnitPrice)
	values (@SalesOrderID, @ProductID, @Quantity, @UnitPrice)
end
else
begin 
	print 'The order does not exist'
end
-- Throw an error for non-existent orders
-- Handle errors
declare @SalesOrderID int = 0;

begin try
	if exists (select * from SalesLT.SalesOrderHeader where SalesOrderID = @SalesOrderID)
	begin
		delete from SalesLT.SalesOrderDetail where SalesOrderID = @SalesOrderID;
		delete from SalesLT.SalesOrderHeader where SalesOrderID = @SalesOrderID;
	end
	else
	begin
		declare @error varchar(100);
		set @error = 'Order #' + cast(@SalesOrderID as varchar) + ' does not exist.';
		throw 50001, @error, 0;
	end
end try
begin catch
	print error_message(); 
end catch
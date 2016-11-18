-- Implement a transaction
declare @SalesOrderID int = 0;
--select @SalesOrderID = MIN(SalesOrderID) from SalesLT.SalesOrderHeader; -- for test use

begin try
	if exists (select * from SalesLT.SalesOrderHeader where SalesOrderID = @SalesOrderID)
	begin
		begin transaction
			delete from SalesLT.SalesOrderDetail where SalesOrderID = @SalesOrderID;
			--throw 50001, 'Test error', 0 -- for test use
			delete from SalesLT.SalesOrderHeader where SalesOrderID = @SalesOrderID;
		commit transaction
	end
	else
	begin
		declare @error varchar(100);
		set @error = 'Order #' + cast(@SalesOrderID as varchar) + ' does not exist.';
		throw 50001, @error, 0;
	end
end try
begin catch
	if @@TRANCOUNT > 0
	begin
		rollback transaction;
		throw;
	end
	else
	begin
		print error_message();
	end 
end catch
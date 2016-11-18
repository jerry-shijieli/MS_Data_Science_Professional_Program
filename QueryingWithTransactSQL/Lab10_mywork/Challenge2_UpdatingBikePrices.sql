-- Write a WHILE loop to update bike prices
declare @MarketMax money = 5000;
declare @MarketAvg money = 2000;
declare @TargetCategory varchar(30) = 'Bikes';
declare @CurrentMax money;
declare @CurrentAvg money;
declare @PriceIncrementPercentage decimal(8,2) = 0.1;

select @CurrentMax = MAX(ListPrice), @CurrentAvg = AVG(ListPrice)
from SalesLT.Product
where ProductCategoryID in
	(select distinct ProductCategoryID
	from SalesLT.vGetAllCategories
	where ParentProductCategoryName = 'Bikes');

WHILE @CurrentAvg < @MarketAvg
begin
	update SalesLT.Product
	set ListPrice = ListPrice * (1+@PriceIncrementPercentage)
	where ProductCategoryID in 
		(select distinct ProductCategoryID
		from SalesLT.vGetAllCategories
		where ParentProductCategoryName = 'Bikes');

	select @CurrentMax = MAX(ListPrice), @CurrentAvg = AVG(ListPrice)
	from SalesLT.Product
	where ProductCategoryID in
	(select distinct ProductCategoryID
	from SalesLT.vGetAllCategories
	where ParentProductCategoryName = 'Bikes');

	if @CurrentMax >= @MarketMax
		break
	else
		continue
end

print 'New average bike price: ' + convert(varchar, @CurrentAvg);
print 'New maximum bike price: ' + convert(varchar, @CurrentMax);

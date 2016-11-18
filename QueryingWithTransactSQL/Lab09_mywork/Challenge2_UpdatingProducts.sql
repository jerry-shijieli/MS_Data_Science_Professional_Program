-- Update product prices
declare @varIncrease decimal(8,2);
set @varIncrease = 0.1;
update SalesLT.Product
set ListPrice = (1+@varIncrease) * ListPrice
from SalesLT.Product as p
inner join SalesLT.ProductCategory as pc
on p.ProductCategoryID = pc.ProductCategoryID
where pc.Name = 'Bells and Horns';

-- Discontinue products
update SalesLT.Product
set DiscontinuedDate = GETDATE()
where ProductCategoryID = 37 and ProductNumber <> 'LT-L123';
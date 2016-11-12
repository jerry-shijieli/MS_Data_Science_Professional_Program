-- Retrieve a list of cities
select distinct City, StateProvince 
from SalesLT.Address;

-- Retrieve the heaviest products
select top 10 percent Name 
from SalesLT.Product
order by Weight desc;

-- Retrieve the heaviest 100 products not including the heaviest ten
select Name 
from SalesLT.Product
order by Weight desc 
offset 10 rows fetch next 100 rows only;
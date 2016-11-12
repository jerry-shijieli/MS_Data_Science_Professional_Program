-- Retrieve product details for product model 1
select Name, Color, Size
from SalesLT.Product
where ProductModelID = 1;

-- Filter products by color and size
select ProductNumber, Name
from SalesLT.Product
where Color in ('Black', 'Red', 'White') and Size in ('S', 'M');

-- Filter products by product number
select ProductNumber, Name, ListPrice
from SalesLT.Product
where ProductNumber like 'BK-%';

-- Retrieve specific products by product number
select ProductNumber, Name, ListPrice
from SalesLT.Product
where ProductNumber like 'BK-[^R]%-[0-9][0-9]';
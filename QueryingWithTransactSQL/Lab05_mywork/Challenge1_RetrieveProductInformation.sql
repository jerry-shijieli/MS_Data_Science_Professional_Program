-- Retrieve the name and approximate weight of each product
select ProductID, UPPER(Name) as ProductName, ROUND(Weight,0) as ApproxWeight
from SalesLT.Product;

--Retrieve the year and month in which products were first sold
select ProductID, UPPER(Name) as ProductName, ROUND(Weight,0) as ApproxWeight,
	DATENAME(year, SellStartDate) as SellStartYear, DATENAME(month, SellStartDate) as SellStartMonth
from SalesLT.Product;

-- Extract product types from product numbers
select ProductID, UPPER(Name) as ProductName, ROUND(Weight,0) as ApproxWeight,
	DATENAME(year, SellStartDate) as SellStartYear, DATENAME(month, SellStartDate) as SellStartMonth,
	SUBSTRING(ProductNumber, 0, 2) as ProductType
from SalesLT.Product;

-- Retrieve only products with a numeric size
select ProductID, UPPER(Name) as ProductName, ROUND(Weight,0) as ApproxWeight,
	DATENAME(year, SellStartDate) as SellStartYear, DATENAME(month, SellStartDate) as SellStartMonth,
	LEFT(ProductNumber, 2) as ProductType
from SalesLT.Product
where ISNUMERIC(Size) = 1;
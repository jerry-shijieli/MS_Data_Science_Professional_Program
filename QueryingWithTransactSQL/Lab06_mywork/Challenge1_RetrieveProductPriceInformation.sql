-- Retrieve products whose list price is higher than the average unit price
select p.ProductID, p.Name, p.ListPrice
from SalesLT.Product as p
where p.ListPrice > (
	select AVG(sod.UnitPrice)
	from SalesLT.SalesOrderDetail as sod
);

-- Retrieve products with a list price of $100 or more that have been sold for less than $100
select p.ProductID, p.Name, p.ListPrice
from SalesLT.Product as p
where p.ProductID in (
	select sod.ProductID 
	from SalesLT.SalesOrderDetail as sod
	where sod.UnitPrice < 100
)
and p.ListPrice >= 100;


-- Retrieve the cost, list price and average sellign price for each product
select p.ProductID, p.Name, p.StandardCost, p.ListPrice,
	(select AVG(sod.UnitPrice)
	 from SalesLT.SalesOrderDetail as sod
	 where p.ProductID = sod.ProductID
	) as AverageUnitPrice
from SalesLT.Product as p
order by p.ProductID;

-- Retrieve products that have an average selling price that is lower than the cost
select p.ProductID, p.Name, p.StandardCost, p.ListPrice,
	(select AVG(sod.UnitPrice)
	 from SalesLT.SalesOrderDetail as sod
	 where p.ProductID = sod.ProductID
	) as AverageUnitPrice
from SalesLT.Product as p
where p.StandardCost > 
	(select AVG(sod.UnitPrice)
	 from SalesLT.SalesOrderDetail as sod
	 where p.ProductID = sod.ProductID)
order by p.ProductID;
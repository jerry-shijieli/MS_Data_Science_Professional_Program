-- Retrieve total sales by product
select p.Name, SUM(sod.LineTotal) as TotalRevenue
from SalesLT.SalesOrderDetail as sod
inner join SalesLT.Product as p
on p.ProductID = sod.ProductID
group by p.Name
order by TotalRevenue desc;

-- Filter the product sales list to include only products that cost over $1000
select p.Name, SUM(sod.LineTotal) as TotalRevenue
from SalesLT.SalesOrderDetail as sod
inner join SalesLT.Product as p
on p.ProductID = sod.ProductID
where p.ListPrice > 1000
group by p.Name
order by TotalRevenue desc;

-- Filter the product sales groups to include only total sales over $20000
 select p.Name, SUM(sod.LineTotal) as TotalRevenue
from SalesLT.SalesOrderDetail as sod
inner join SalesLT.Product as p
on p.ProductID = sod.ProductID
where p.ListPrice > 1000
group by p.Name
having SUM(sod.LineTotal) > 20000
order by TotalRevenue desc;
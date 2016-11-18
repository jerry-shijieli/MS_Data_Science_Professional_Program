-- Retrieve customer sales revenue for each parent category
select * from
(select c.CompanyName, gac.ParentProductCategoryName, sod.LineTotal
from SalesLT.SalesOrderDetail as sod
join SalesLT.SalesOrderHeader as soh on sod.SalesOrderID=soh.SalesOrderID
join SalesLT.Customer as c on c.CustomerID=soh.CustomerID
join SalesLT.Product as p on p.ProductID=sod.ProductID
join SalesLT.vGetAllCategories as gac on gac.ProductCategoryID=p.ProductCategoryID) as source_table
pivot
(sum(LineTotal) for ParentProductCategoryName in ([Accessories],[Bikes],[Clothing],[Components])) as pvt
order by CompanyName;
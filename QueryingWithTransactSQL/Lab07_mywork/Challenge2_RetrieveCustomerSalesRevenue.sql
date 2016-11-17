-- Retrieve sales revenue by customer and contact
-- using derived table
select CompanyContactName, sum(TotalSales) as TotalRevenue
from
	(select c.CompanyName+' ('+c.FirstName+' '+c.LastName+')', soh.TotalDue
	from SalesLT.SalesOrderHeader as soh
	inner join SalesLT.Customer as c
	on soh.CustomerID = c.CustomerID) as derived_SalesOrder(CompanyContactName, TotalSales)
group by CompanyContactName
order by CompanyContactName;

-- using CTE
with CompanySalesOrder(CompanyContactName, TotalSales)
as 
(select concat(c.CompanyName, concat(' ('+c.FirstName, ' '+c.LastName+')')), soh.TotalDue
from SalesLT.SalesOrderHeader as soh
inner join SalesLT.Customer as c
on soh.CustomerID = c.CustomerID)
select CompanyContactName, sum(TotalSales)
from CompanySalesOrder
group by CompanyContactName
order by CompanyContactName;
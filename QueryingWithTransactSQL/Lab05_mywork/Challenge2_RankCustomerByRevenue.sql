-- Retrieve companies ranked by sales totals
select c.CompanyName, soh.TotalDue,
	ROW_NUMBER() OVER (order by soh.TotalDue desc) as RankByTotalDue
from SalesLT.SalesOrderHeader as soh
inner join SalesLT.Customer as c
on soh.CustomerID = c.CustomerID;
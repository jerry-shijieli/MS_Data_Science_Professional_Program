-- Retrieve customer information for all sales orders
select soh.SalesOrderID, GCI.CustomerID, GCI.FirstName, GCI.LastName, soh.TotalDue
from SalesLT.SalesOrderHeader as soh
cross apply dbo.ufnGetCustomerInformation(soh.CustomerID) as GCI
order by soh.SalesOrderID;

-- Retrieve customer address information 
select ca.CustomerID, GCI.FirstName, GCI.LastName, addr.AddressLine1, addr.City
from SalesLT.CustomerAddress as ca
inner join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
cross apply dbo.ufnGetCustomerInformation(ca.CustomerID) as GCI
order by ca.CustomerID;
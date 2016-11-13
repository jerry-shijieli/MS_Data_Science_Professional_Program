-- Retrieve customer orders
select cst.CompanyName, soh.SalesOrderID, soh.TotalDue
from SalesLT.Customer as cst
join SalesLT.SalesOrderHeader as soh
on cst.CustomerID = soh.CustomerID;

-- Retrieve customer orders with addresses
select cst.CompanyName, soh.SalesOrderID, soh.TotalDue, 
	addr.AddressLine1+' '+ISNULL(addr.AddressLine2+' ', '')+addr.City+' '+addr.StateProvince+' '+addr.PostalCode+' '+addr.CountryRegion as MainOfficAddress
from SalesLT.Customer as cst
join SalesLT.SalesOrderHeader as soh
on cst.CustomerID = soh.CustomerID
join SalesLT.CustomerAddress as caddr
on cst.CustomerID = caddr.CustomerID and caddr.AddressType = 'Main Office'
join SalesLT.Address as addr
on addr.AddressID = caddr.AddressID;
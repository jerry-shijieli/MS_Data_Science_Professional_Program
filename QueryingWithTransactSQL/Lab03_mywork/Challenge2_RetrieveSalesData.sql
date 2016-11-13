-- Retrieve a list of all customers and their orders
select c.CompanyName, c.FirstName+' '+c.LastName as Contacts, soh.SalesOrderID, soh.TotalDue
from SalesLT.Customer as c
full join SalesLT.SalesOrderHeader as soh
on c.CustomerID = soh.CustomerID
order by soh.SalesOrderID desc, soh.TotalDue desc;

-- Retrieve a list of customers with no address
select c.CustomerID, c.CompanyName, c.FirstName+' '+c.LastName as Contacts, c.Phone
from SalesLT.Customer as c
left join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
where ca.AddressID IS NULL;

-- Retrieve a list of customers and products without orders
select c.CustomerID, p.ProductID
from SalesLT.Customer as c
full join SalesLT.SalesOrderHeader as soh
on c.CustomerID = soh.CustomerID
full join SalesLT.SalesOrderDetail as sod
on soh.SalesOrderID = sod.SalesOrderID
full join SalesLT.Product as p
on sod.ProductID = p.ProductID
where sod.SalesOrderID IS NULL
order by ProductID, CustomerID;
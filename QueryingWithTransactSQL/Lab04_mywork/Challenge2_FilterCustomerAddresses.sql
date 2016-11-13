-- Retrieve customes with only a main office address
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Main Office'
except
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Shipping'
order by c.CompanyName;

-- Retrieve only customers with both a main office address and a shipping address
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Main Office'
intersect
select c.CompanyName
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Shipping'
order by c.CompanyName;
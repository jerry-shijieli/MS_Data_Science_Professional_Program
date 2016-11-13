-- Retrieve billing addresses
select c.CompanyName, addr.AddressLine1, addr.City, 'Billing' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Main Office';

-- Retrieve shipping addresses
select c.CompanyName, addr.AddressLine1, addr.City, 'Shipping' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Shipping';

-- Combine billing and shippping addresses
select c.CompanyName, addr.AddressLine1, addr.City, 'Billing' as AddressType
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Main Office'
UNION ALL
select c.CompanyName, addr.AddressLine1, addr.City, 'Shipping' as AddressType 
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as addr
on ca.AddressID = addr.AddressID
where ca.AddressType = 'Shipping'
order by c.CompanyName, AddressType;
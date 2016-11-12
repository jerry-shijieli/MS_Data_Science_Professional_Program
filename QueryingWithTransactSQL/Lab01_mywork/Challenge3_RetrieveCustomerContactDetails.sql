-- Retrieve customer contact names with middle names if known
select FirstName + ' ' + ISNULL(MiddleName+' ', '') + LastName As CustomerName
from SalesLT.Customer;

-- Manually remove email addresses for task2
update SalesLT.Customer
set EmailAddress = NULL 
where CustomerID % 7 = 1;
-- Retrieve primary contact details
select ISNULL(EmailAddress, Phone) as PrimaryContact
from SalesLT.Customer;

-- Mannully remove shipping date for task 3
update SalesLT.SalesOrderHeader
set ShipDate = NULL
where SalesOrderID > 71899;
-- Retrieve shipping status
select SalesOrderID, OrderDate,
	case
		when ShipDate IS NULL then 'Awaiting Shpment'
		else 'Shipped'
	end as ShippingStatus
from SalesLT.SalesOrderHeader;

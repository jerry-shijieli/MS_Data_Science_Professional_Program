-- Retrieve a list of customer companies
select cast(CustomerID As varchar) + ': ' + CompanyName As CustomerCompany
from SalesLT.Customer;

-- Retrieve a list of sales order revisions
select SalesOrderNumber + '(' + STR(RevisionNumber, 1) + ')' As OrderRevision, 
	Convert(nvarchar(30), OrderDate, 102) As OrderDate
from SalesLT.SalesOrderHeader;
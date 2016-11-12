-- Retrieve all columns for all customers
select * from SalesLT.Customer;

-- Retrieve customer name data
select title, firstname, middlename, lastname, suffix 
from SalesLT.Customer;

-- Retrieve customer names and phone numbers
select SalesPerson, Title + ' ' + LastName As CustomerName, Phone
from SalesLT.Customer;
-- Insert a product
insert into SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
values ('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

select scope_identity();

select * from SalesLT.Product
where ProductID = scope_identity();

-- Insert a new category with tow products
insert into SalesLT.ProductCategory (ParentProductCategoryID, Name)
values (4, 'Bells and Horns');

insert into SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
values 
('Bicycle Bell', 'BB-RING', 2.47, 4.99, ident_current('SalesLT.ProductCategory'), GETDATE()),
('Bicycle Horn', 'BB-PARP', 1.29, 3.75, ident_current('SalesLT.ProductCategory'), GETDATE());

select p.Name as ProductName, pc.Name as ProductCategory
from SalesLT.Product as p
inner join SalesLT.ProductCategory as pc
on p.ProductCategoryID = pc.ProductCategoryID
where p.ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');
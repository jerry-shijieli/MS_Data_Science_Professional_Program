-- Retrieve product model descriptions
select p.ProductID, p.Name, pmcd.Summary
from SalesLT.Product as p
inner join SalesLT.vProductModelCatalogDescription as pmcd
on p.ProductModelID = pmcd.ProductModelID
order by p.ProductID;

-- Create a table of distinct colors
declare @Colors as table (Color nvarchar(30));

insert into @Colors
select distinct Color from SalesLT.Product;

select ProductID, Name, Color
from SalesLT.Product
where Color in (select Color from @Colors);

-- Retrieve product parent categories
select gac.ParentProductCategoryName as ParentCategory,
	gac.ProductCategoryName as Category,
	p.ProductID, p.Name as ProductName
from SalesLT.Product as p
inner join dbo.ufnGetAllCategories() as gac
on p.ProductCategoryID = gac.ProductCategoryID
order by ParentCategory, Category, ProductName;
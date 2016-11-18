-- Delete a product category adn its products
delete from SalesLT.Product
where ProductCategoryID = 
	(select ProductCategoryID from SalesLT.ProductCategory where Name='Bells and Horns');

delete from SalesLT.ProductCategory
where Name = 'Bells and Horns';
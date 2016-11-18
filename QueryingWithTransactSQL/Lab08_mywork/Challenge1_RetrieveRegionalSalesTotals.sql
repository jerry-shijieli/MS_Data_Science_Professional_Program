-- Retrieve totals for country/region and state/province
SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

-- Indicate the grouping level in the results
SELECT a.CountryRegion, a.StateProvince,
	iif(GROUPING_ID(a.CountryRegion)=1 and GROUPING_ID(a.StateProvince)=1, 'Total', 
	iif(grouping_id(a.StateProvince)=1, a.CountryRegion+'Subtotal', a.StateProvince+'Subtotal')) as Level,
	SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

-- Add a grouping level for cities
SELECT a.CountryRegion, a.StateProvince, a.City,
	choose(1+GROUPING_ID(a.CountryRegion)+GROUPING_ID(a.StateProvince)+GROUPING_ID(a.City), 
	a.City+' Subtotal', a.StateProvince+' Subtotal', a.CountryRegion+' Subtotal', 'Total') as Level,
	SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City;
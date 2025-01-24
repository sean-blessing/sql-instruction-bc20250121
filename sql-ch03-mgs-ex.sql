SELECT *
  FROM Categories;

SELECT *
  FROM Products;

-- #4. Display ProductName, ListPrice, DiscountPercent, 
--     DiscountAmount (calc), DiscountPrice(calc)
--     SORT: DiscountPrice(desc)
SELECT ProductName, ListPrice, DiscountPercent,
	   (ListPrice * (DiscountPercent/100)) as DiscountAmount,
	   (ListPrice - (ListPrice * (DiscountPercent/100))) as DiscountPrice
  FROM Products
 ORDER BY DiscountPrice DESC;
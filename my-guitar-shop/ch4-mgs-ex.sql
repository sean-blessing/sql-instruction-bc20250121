-- #3 Write a SELECT statement that joins the Customers table to the Addresses table 
-- and returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
-- Code the join so only addresses that are the shipping address for a customer are returned.

SELECT *
  FROM Customers;
SELECT *
  FROM Addresses;

SELECT C.CustomerID, LastName, Line1 AS StreetAddress, City, State, ZipCode
  FROM Customers C
  JOIN Addresses A ON C.ShippingAddressID = A.AddressID
  Order By C.CustomerID;
  -- AND C.CustomerID = A.CustomerID;

-- #5 Write a SELECT statement that returns the ProductName and ListPrice columns from the Products table.
-- Return one row for each product that has the same list price as another product. (Hint: Use a self-join to check that the ProductID columns aren’t equal but the ListPrice column is equal.)
-- Sort the result set by ProductName.

SELECT P1.ProductName, P1.ListPrice
  FROM Products P1
  JOIN Products P2 ON P1.ListPrice = P2.ListPrice
 WHERE P1.ProductID != P2.ProductID 
  ORDER BY P1.ListPrice;

-- author solution
SELECT p1.ProductName, p1.ListPrice
FROM Products p1 
  JOIN Products p2
    ON p1.ProductID <> p2.ProductID AND
       p1.ListPrice = p2.ListPrice
ORDER BY p1.ProductName;
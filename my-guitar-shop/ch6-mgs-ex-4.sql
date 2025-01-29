-- ch6 MGS Ex#1
SELECT * 
  FROM Products;
SELECT *
  FROM Categories;

SELECT *
  FROM Products P
  JOIN Categories C ON C.CategoryID = P.CategoryID;

SELECT DISTINCT(CategoryName)
  FROM Categories C
  JOIN Products P ON P.CategoryID = C.CategoryID
 ORDER BY CategoryName;

-- use a subquery that uses the IN operator
-- categories that are in the products table:
SELECT DISTINCT(CategoryID)
  FROM Products;

-- original query w/ subquery rather than JOIN
SELECT DISTINCT(CategoryName)
  FROM Categories
 WHERE CategoryID IN
  (
	SELECT DISTINCT(CategoryID) FROM Products
  )
 ORDER BY CategoryName;

-- #4 
-- A) JOIN: Order - OrderItems Order - Customer
--    Write a SELECT statement that returns three columns: EmailAddress, OrderID, and the order total for each order.
--    OrderTotal = SUM(OrderItems Totals)
--    OrderItemTotal = (ItemPrice - DiscountAmount) * Quantity
--    To do this, you can group the result set by the EmailAddress and OrderID columns. 
--    Then, you can calculate the order total from the columns in the OrderItems table.
-- B) Write a second SELECT statement that uses the first SELECT statement in its FROM clause. 
--    The main query should return two columns: the customer’s email address and the largest order for that customer. 
--    To do this, you can group the result set by the EmailAddress column.

SELECT EmailAddress, O.OrderID, SUM(((ItemPrice - DiscountAmount) * Quantity)) AS OrderTotal 
  FROM Orders O
  JOIN Customers C ON C.CustomerID = O.CustomerID
  JOIN OrderItems OI ON OI.OrderID = O.OrderID
 GROUP BY EmailAddress, O.OrderID;

SELECT EmailAddress, MAX(OrderTotal) MaxOrderTotal
  FROM (
	SELECT EmailAddress, O.OrderID, SUM(((ItemPrice - DiscountAmount) * Quantity)) AS OrderTotal 
		FROM Orders O
		JOIN Customers C ON C.CustomerID = O.CustomerID
		JOIN OrderItems OI ON OI.OrderID = O.OrderID
	GROUP BY EmailAddress, O.OrderID) AS OrderTotals
 GROUP BY EmailAddress;
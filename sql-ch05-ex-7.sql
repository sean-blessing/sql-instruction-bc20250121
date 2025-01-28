-- Chap 5
-- Ex 7
-- Write a SELECT statement that returns four columns: VendorName, Account-Description, LineItemCount, and LineItemSum. 
--LineItemCount is the row count, and LineItemSum is the sum of the InvoiceLineItemAmount column. 
-- For each vendor and account, return the number and sum of line items, sorted first by vendor, then by account description. 
-- Hint: Use a four-table join

SELECT TOP (5) *
FROM Vendors;
SELECT TOP (5) *
  FROM GLAccounts;
SELECT TOP (5) *
  FROM Invoices;
SELECT TOP (5) *
  FROM InvoiceLineItems;

SELECT *
  FROM INvoices;
SELECT *
 FROM Vendors
 WHERE VendorID = 123;

 SELECT *
   FROM InvoiceLineItems
  Where InvoiceID = 2;

SELECT *
  FROM GLAccounts;

/* SELECT VendorName, I.InvoiceID, ILI.AccountNo, ILI.InvoiceLineItemAmount, G.AccountDescription
  FROM Invoices I
  JOIN Vendors V ON V.VendorID = I.VendorID
  JOIN InvoiceLineItems ILI ON ILI.InvoiceID = I.InvoiceID
  JOIN GLAccounts G ON G.AccountNo = ILI.AccountNo
  ORDER By I.InvoiceID, ILI.InvoiceSequence;
*/
SELECT VendorName, AccountDescription, COUNT(ILI.InvoiceID) LineItemCount, SUM(InvoiceLineItemAmount) LineItemSum
  FROM Invoices I
  JOIN Vendors V ON V.VendorID = I.VendorID
  JOIN InvoiceLineItems ILI ON ILI.InvoiceID = I.InvoiceID
  JOIN GLAccounts G ON G.AccountNo = ILI.AccountNo
 GROUP BY VendorName, AccountDescription
  ORDER By VendorName, AccountDescription;

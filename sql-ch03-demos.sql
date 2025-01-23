-- SELECT * FROM Invoices;
-- select * from invoices;
-- SeLeCt * FroM InVoicES;
SELECT *
  FROM Invoices;

-- Get VendorID, InvoiceNumber, InvoiceTotal
SELECT VendorID, InvoiceNumber, InvoiceTotal
  FROM Invoices;

-- WHERE clause - where invoiceTotal > 2000
SELECT VendorID, InvoiceNumber, InvoiceTotal
  FROM Invoices
 WHERE InvoiceTotal >= 2000;

-- Calculated Value - Total Credits
-- SELECT PaymentTotal, CreditTotal, PaymentTotal + CreditTotal AS TotalCredits
SELECT PaymentTotal, CreditTotal, (PaymentTotal + CreditTotal) TotalCredits
  FROM Invoices;

-- order by total credits, add InvoiceDate
SELECT InvoiceDate, PaymentTotal, CreditTotal, (PaymentTotal + CreditTotal) TotalCredits
  FROM Invoices
ORDER BY TotalCredits DESC;

-- return only dates between 1/1/23 and 3/31/23
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
  FROM Invoices
 WHERE InvoiceDate BETWEEN '2023-01-01' and '2023-03-31'
 ORDER BY InvoiceDate;

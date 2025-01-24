-- Chapter 4 Demos

-- Vendors and Invoices tables
SELECT *
  FROM Vendors;

SELECT *
  FROM Invoices
 ORDER BY VendorID;

 -- which vendors have we invoiced? (done business with us)
 -- which vendors have we not done business with?
 -- which vendors have spent the most money with us?

 -- p. 103 join Vendors and Invoices
 SELECT InvoiceNumber, VendorName
   FROM Invoices
   JOIN Vendors on Vendors.VendorID = Invoices.VendorID;
-- All vendors who have been invoiced

-- p. 105 - aliases in joins w/ AS keyword
 SELECT InvoiceNumber, VendorName
   FROM Invoices AS Inv
   JOIN Vendors AS Ven on Ven.VendorID = Inv.VendorID;

-- a little simpler
 SELECT InvoiceNumber, VendorName
   FROM Invoices AS I
   JOIN Vendors AS V on V.VendorID = I.VendorID;

-- simplest form
 SELECT InvoiceNumber, VendorName
   FROM Invoices I
   JOIN Vendors V on V.VendorID = I.VendorID;


-- add in a calculated column, where, order by
 SELECT InvoiceNumber, VendorName, InvoiceDueDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
   FROM Invoices I
   JOIN Vendors V on V.VendorID = I.VendorID
  WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
 ORDER BY InvoiceDueDate DESC;

-- p. 107 fully qualified object names
SELECT *
  FROM AP.dbo.Vendors;

-- p. 109 joining on multiple things
-- Invoices to InvoiceLineItems AND InvoiceTotal to InvoiceLineItemAmount
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
  FROM Invoices I
  JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
   AND I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber;

-- change 2nd condition to a where clause
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
  FROM Invoices I
  JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
 WHERE I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber;

-- p. 111 Vendors Table - self join
-- vendors from cities in common with other vendors
SELECT DISTINCT V1.VendorName, V1.VendorCity, V1.VendorState
  FROM Vendors V1
  JOIN Vendors V2 ON V1.VendorCity = V2.VendorCity
					AND V1.VendorState = V2.VendorState
					AND V1.VendorID <> V2.VendorID
ORDER BY V1.VendorState, V1.VendorCity;

-- p. 115 implicit join - vendors and invoices (vendors who have invoices)
SELECT InvoiceNumber, VendorName
  FROM Invoices I, Vendors V
 WHERE V.VendorID = I.VendorID;

 -- which vendors have we invoiced? (done business with us)
 -- which vendors have we not done business with?
 -- which vendors have spent the most money with us?

-- vendors & invoices - left outter join
-- We want ALL data from Vendors(122 records) AND Invoice (114 records) Data if exists
SELECT VendorName, InvoiceNumber, InvoiceTotal
  FROM Vendors V
  LEFT JOIN Invoices I ON V.VendorID = I.VendorID
 ORDER BY VendorName;

 -- same thing as right outter join
SELECT VendorName, InvoiceNumber, InvoiceTotal
  FROM Invoices I
  RIGHT JOIN Vendors V ON V.VendorID = I.VendorID
 ORDER BY VendorName;

-- vendors and invoices - left outter join where InvoiceNumber is NULL
-- which vendors have we not done business with (don't appear in the invoices table)?
SELECT VendorName, InvoiceNumber, InvoiceTotal
  FROM Vendors V
  LEFT JOIN Invoices I ON V.VendorID = I.VendorID
 WHERE InvoiceNumber IS NULL
 ORDER BY VendorName;


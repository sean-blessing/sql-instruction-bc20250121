-- Chapter 6 - #7
--  Write a SELECT statement that returns the name, city, and state of each vendor 
-- that’s located in a unique city and state. In other words, 
-- don’t include vendors that have a city and state in common with another vendor.
SELECT VendorID, VendorName, VendorState, VendorCity
  FROM Vendors
 ORDER BY VendorState, VendorCity;

SELECT V1.VendorID, V1.VendorName, V1.VendorState, V1.VendorCity
  FROM Vendors V1
 WHERE V1.VendorID NOT IN (
  SELECT DISTINCT(V2.VendorID)
    FROM Vendors V2
    JOIN Vendors V3 ON V3.VendorState = V2.VendorState
                   AND V3.VendorCity = V2.VendorCity
		  		   AND V3.VendorID <> V2.VendorID
	)
 ORDER BY V1.VendorState, V1.VendorCity;

-- subquery - returning vendor ids for vendors who have same city/state combos
-- included: 68, 93, 96, 51,52, 18, 19, 23, 25...
-- excluded: 20, 29, 64, 37...
SELECT DISTINCT(V2.VendorID)
  FROM Vendors V2
  JOIN Vendors V3 ON V3.VendorState = V2.VendorState
                 AND V3.VendorCity = V2.VendorCity
				 AND V3.VendorID <> V2.VendorID
 ORDER BY V2.VendorID;

-- author alt solution
SELECT VendorName, VendorCity, VendorState
FROM Vendors AS Vendors_Main
WHERE VendorCity + VendorState NOT IN
	(SELECT VendorCity + VendorState
	FROM Vendors AS Vendors_Sub
	WHERE Vendors_Sub.VendorID <> Vendors_Main.VendorID)
ORDER BY VendorState, VendorCity;

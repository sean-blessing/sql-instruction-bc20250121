-- ch 6
-- #7  Write a SELECT statement that returns the name, city, and state 
-- of each vendor that’s located in a unique city and state. 
-- In other words, don’t include vendors that have a city and state in common with another vendor

SELECT V1.VendorName, V1.VendorCity, V1.VendorState
  FROM Vendors V1
  Where V1.VendorID NOT IN 
  (SELECT V2.VendorID
     FROM Vendors V2
	 JOIN Vendors V3 ON V2.VendorState = V3.VendorState
	  AND V2.VendorCity = V3.VendorCity
	  AND V2.VendorID <> V3.VendorID)
 ORDER BY V1.VendorState, V1.VendorCity;


-- author alt solution
SELECT VendorName, VendorCity, VendorState
FROM Vendors AS Vendors_Main
WHERE VendorCity + VendorState NOT IN
	(SELECT VendorCity + VendorState
	FROM Vendors AS Vendors_Sub
	WHERE Vendors_Sub.VendorID <> Vendors_Main.VendorID)
ORDER BY VendorState, VendorCity;
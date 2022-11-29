-- task 1 create microsoft course query
SELECT * FROM dbo.Course AS c WHERE c.VendorID = 2

-- task 2 use temp tables
SELECT * FROM #MicrosoftLocal
SELECT * FROM #MicrosoftGlobal

CREATE VIEW dbo.CourseList AS
SELECT V.VendorName, C.CourseName, C.CourseID
FROM dbo.Vendor as V
INNER JOIN dbo.Course AS C
ON V.VendorID = C.VendorID
GO
SELECT * FROM dbo.CourseList
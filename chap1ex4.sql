-- Task 1
SELECT CourseRunID, StartDate
FROM dbo.Trainer AS t
INNER JOIN dbo.CourseRun AS cr
ON t.TrainerID = cr.TrainerID
WHERE TrainerName = 'Jason Bourne'

-- Task 2
WITH BourneCourses AS(
SELECT CourseRunID, StartDate
FROM dbo.Trainer AS t
INNER JOIN dbo.CourseRun AS CR
ON t.TrainerID = cr.TrainerID
WHERE TrainerName = 'Jason Bourne')
SELECT * FROM BourneCourses

-- Task 3
WITH BourneCourses AS(
SELECT CourseRunID, StartDate
FROM dbo.Trainer AS t
INNER JOIN dbo.CourseRun AS CR
ON t.TrainerID = cr.TrainerID
WHERE TrainerName = 'Jason Bourne')
SELECT d.DelegateID, d.DelegateName, d.CompanyName, jb.StartDate
FROM dbo.Delegate AS d
INNER JOIN dbo.DelegateAttendance AS da
ON d.DelegateID = da.DelegateID
INNER JOIN BourneCourses AS jb
ON da.CourseRunID = jb.CourseRunID
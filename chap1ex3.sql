SELECT CourseRunID, StartDate
FROM dbo.Trainer as t
INNER JOIN dbo.CourseRun AS cr
ON t.TrainerID = cr.TrainerID
WHERE TrainerName = 'Jason Bourne'

SELECT da.DelegateID, d.DelegateName, d.CompanyName, jb.StartDate
FROM dbo.DelegateAttendance	AS da
INNER JOIN dbo.Delegate AS d
ON da.DelegateID = d.DelegateID
JOIN(
SELECT cr.CourseRunID, cr.StartDate
FROM dbo.Trainer AS t
INNER JOIN dbo.CourseRun AS cr
ON t.TrainerID = cr.TrainerID
WHERE t.TrainerName = 'Jason Bourne'
) AS jb
ON da.CourseRunID = jb.CourseRunID
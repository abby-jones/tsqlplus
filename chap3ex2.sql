-- ex2 task 1
SELECT * FROM dbo.VendorCourseDateDelegateCount
-- ex2 task 2
SELECT *,
RANK() 
OVER(ORDER BY NumberDelegates DESC)
AS LeaguePos_Rank,
DENSE_RANK() 
OVER(ORDER BY NumberDelegates DESC)
AS LeaguePos_DenseRank,
ROW_NUMBER() 
OVER(ORDER BY NumberDelegates DESC)
AS LeaguePos_Row,
NTILE(3) 
OVER(ORDER BY NumberDelegates DESC)
AS LeaguePos_NTile
FROM dbo.VendorCourseDateDelegateCount
GO

-- ex2 task2
SELECT * FROM dbo.VendorCourseDateDelegateCount
GO

SELECT *, RANK() 
OVER(PARTITION BY VendorName ORDER BY NumberDelegates DESC)
FROM dbo.VendorCourseDateDelegateCount
GO

WITH Ranked_Courses AS(
SELECT *,
RANK() OVER(PARTITION BY VendorName
ORDER BY NumberDelegates DESC) AS LeaguePos
FROM dbo.VendorCourseDateDelegateCount)
SELECT VendorName, CourseName, NumberDelegates
FROM Ranked_Courses
WHERE LeaguePos = 1
GO

SELECT VendorName, CourseName, NumberDelegates
FROM(
SELECT *,
RANK() OVER(PARTITION BY VendorName
ORDER BY NumberDelegates DESC) AS LeaguePos
FROM dbo.VendorCourseDateDelegateCount
) AS dt
WHERE LeaguePos = 1
GO
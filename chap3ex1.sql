-- ex1 task 1
SELECT ProductID, TransferDate, TransferAmount 
FROM dbo.BookTransfers

-- ex1 task 2
SELECT ProductID, SUM(TransferAmount) AS Stock
FROM dbo.BookTransfers
GROUP BY ProductID

-- ex1 task 3
SELECT ProductID, TransferDate, TransferAmount, SUM(TransferAmount)
OVER(PARTITION by ProductID ORDER BY TransferDate)
AS RunningStock
FROM dbo.BookTransfers
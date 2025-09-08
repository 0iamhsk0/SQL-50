-- Write your PostgreSQL query statement below
SELECT e.name, b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
ON b.empID = e.empID
WHERE b.bonus < 1000
OR b.bonus IS NULL
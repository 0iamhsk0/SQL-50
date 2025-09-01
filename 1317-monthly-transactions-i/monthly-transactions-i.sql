-- Write your PostgreSQL query statement below
SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(COALESCE(amount, 0)) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN COALESCE(amount, 0) ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY 1, 2;


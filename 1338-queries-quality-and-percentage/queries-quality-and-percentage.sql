-- Write your PostgreSQL query statement below
SELECT query_name, 
    ROUND(AVG(rating * 1.0 / position)::NUMERIC, 2) AS quality,
    ROUND(SUM((rating < 3)::INT) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
WHERE 1 IS NOT NULL
GROUP BY 1;

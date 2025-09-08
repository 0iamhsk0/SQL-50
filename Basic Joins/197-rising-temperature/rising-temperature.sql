-- Write your PostgreSQL query statement below

-- Using self join
-- SELECT w1.id
-- FROM Weather w1
-- INNER JOIN Weather w2
-- ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
-- WHERE w1.temperature > w2.temperature;

-- Using lag
WITH rising AS (
  SELECT id,
         recordDate,
         temperature,
         LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
         LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
    FROM Weather
)
SELECT id
FROM rising
WHERE recordDate = prev_date + INTERVAL '1 day'
  AND temperature > prev_temp;




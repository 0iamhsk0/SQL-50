-- Subquery
-- SELECT b.machine_id, round(avg(b.dif)::numeric,3) processing_time
-- FROM (SELECT a.machine_id, max(a.timestamp) - min(a.timestamp) dif
--     FROM activity a
--     GROUP BY a.machine_id, a.process_id) b
-- GROUP BY b.machine_id;

-- Self Join
SELECT s.machine_id, round(avg(e.timestamp - s.timestamp)::numeric, 3) AS processing_time
FROM activity s
JOIN activity e 
ON e.machine_id = s.machine_id
AND e.process_id = s.process_id
WHERE s.activity_type = 'start' AND e.activity_type = 'end'
GROUP BY s.machine_id
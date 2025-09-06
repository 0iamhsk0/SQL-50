SELECT b.machine_id, round(avg(b.dif)::numeric,3) processing_time
FROM (SELECT a.machine_id, max(a.timestamp) - min(a.timestamp) dif
    FROM activity a
    GROUP BY a.machine_id, a.process_id) b
GROUP BY b.machine_id;
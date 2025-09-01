SELECT 
    ROUND(1.0 * COUNT(DISTINCT a.player_id) / COUNT(DISTINCT b.player_id), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) b
LEFT JOIN Activity a
ON b.player_id = a.player_id
AND a.event_date = b.first_login + INTERVAL '1' DAY;

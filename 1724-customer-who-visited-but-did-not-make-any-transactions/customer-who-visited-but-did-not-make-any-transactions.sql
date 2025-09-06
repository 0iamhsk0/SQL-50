SELECT DISTINCT v.customer_id, COUNT(v.customer_id) count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- OR

-- SELECT v.customer_id, count(v.customer_id) count_no_trans
-- FROM visits v
-- WHERE NOT EXISTS (SELECT 1 FROM transactions t WHERE v.visit_id = t.visit_id)
-- GROUP BY v.customer_id;
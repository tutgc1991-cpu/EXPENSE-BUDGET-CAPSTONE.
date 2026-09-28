EXPLAIN (ANALYZE, BUFFERS)
SELECT
    category_id,
    SUM(amount) AS total_spent
FROM expenses
WHERE expense_date >= '2026-09-01'
  AND expense_date < '2026-10-01'
GROUP BY category_id
ORDER BY total_spent DESC;
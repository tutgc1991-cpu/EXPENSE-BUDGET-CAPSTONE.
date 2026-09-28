EXPLAIN (ANALYZE, BUFFERS)
SELECT
    b.id,
    b.name,
    b.amount AS budget_amount,
    COALESCE(SUM(e.amount), 0) AS total_spent,
    b.amount - COALESCE(SUM(e.amount), 0) AS remaining
FROM budgets b
LEFT JOIN expenses e
    ON e.budget_id = b.id
WHERE b.user_id = 1
GROUP BY b.id, b.name, b.amount
ORDER BY b.id;
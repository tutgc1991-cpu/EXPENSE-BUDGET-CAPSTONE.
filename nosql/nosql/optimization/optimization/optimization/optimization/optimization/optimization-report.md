# Query Optimization Report

## Query 1 — Budget Expense Summary

### 1. QUERY

The query calculates the total amount spent for each budget and the remaining budget amount.

### 2. BEFORE PLAN

The initial query was executed using:

```sql
EXPLAIN (ANALYZE, BUFFERS)
...
```

The actual PostgreSQL output is included below:

```text
PASTE YOUR REAL EXPLAIN ANALYZE OUTPUT HERE
```

### 3. CHANGE

The `expenses(budget_id)` index was created:

```sql
CREATE INDEX idx_expenses_budget_id
ON expenses(budget_id);
```

The index supports the relationship between budgets and expenses and can reduce the amount of data PostgreSQL needs to scan when locating expenses belonging to a budget.

### 4. AFTER PLAN

```text
PASTE YOUR REAL AFTER EXPLAIN ANALYZE OUTPUT HERE
```

### 5. RESULT

Record the actual measurements from PostgreSQL.

Example format:

```text
Execution time before: [actual value]
Execution time after:  [actual value]

Plan before: [actual plan]
Plan after:  [actual plan]
```

Do not claim a specific improvement unless it was measured using EXPLAIN ANALYZE.

---

## Query 2 — Category Spending Report

### 1. QUERY

The query calculates total spending by category for a selected date range.

### 2. BEFORE PLAN

```text
PASTE YOUR REAL EXPLAIN ANALYZE OUTPUT HERE
```

### 3. CHANGE

An index on `expense_date` and `category_id` was added:

```sql
CREATE INDEX idx_expenses_date_category
ON expenses(expense_date, category_id);
```

### 4. AFTER PLAN

```text
PASTE YOUR REAL EXPLAIN ANALYZE OUTPUT HERE
```

### 5. RESULT

Record the actual execution times and plan differences.

```text
Execution time before: [actual value]
Execution time after:  [actual value]


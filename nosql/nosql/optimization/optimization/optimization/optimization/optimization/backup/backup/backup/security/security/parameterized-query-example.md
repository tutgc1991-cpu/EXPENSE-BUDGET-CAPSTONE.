# Parameterized Query Security

The application should use parameterized queries instead of constructing SQL statements through string concatenation.

## Unsafe approach

The application should not construct SQL like this:

```text
"SELECT * FROM expenses WHERE budget_id = " + user_input
```

## Safe approach

A parameterized query separates SQL code from user-provided values:

```sql
SELECT
    id,
    amount,
    description,
    expense_date
FROM expenses
WHERE budget_id = $1;
```

The application supplies the budget ID separately as a parameter.

This prevents user input from being interpreted as part of the SQL statement and is an important protection against SQL injection.

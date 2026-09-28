# Redis Design and Justification

## Why Redis is included

Redis is used as a caching layer for frequently requested budget summaries.

PostgreSQL remains the system of record. Redis does not replace PostgreSQL.

## Problem being solved

Budget summaries can require aggregate calculations such as:

* total budget
* total expenses
* remaining amount
* spending percentage

If the same summary is requested repeatedly, recalculating it from PostgreSQL on every request can create unnecessary database workload.

Redis can temporarily store the calculated result.

## Example Redis key

```text
budget:1:summary
```

Example cached value:

```json
{
  "budget_id": 1,
  "budget": 50000,
  "spent": 52000,
  "remaining": -2000,
  "percentage_used": 104
}
```

## Why Redis instead of PostgreSQL for this component?

PostgreSQL is better for permanent relational data, transactions, constraints, reporting, and recovery.

Redis is better suited to temporary, frequently accessed cached values because it is an in-memory key-value store.

## Cache strategy

When a user requests a budget summary:

1. Check Redis.
2. If the value exists, return the cached value.
3. If it does not exist, calculate the summary from PostgreSQL.
4. Store the result in Redis.
5. Return the result.

When a relevant expense changes, the corresponding cache entry should be invalidated or refreshed.

## Important design decision

Redis is not authoritative.

If Redis is unavailable, the application can retrieve the data directly from PostgreSQL and continue operating.

This makes Redis an optimization layer rather than a dependency for permanent data storage.


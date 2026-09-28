# Expense & Budget Management System

## Student

**Name:** Tut Gatluak Chol

**Date:** September 28, 2026

## Project Overview

This capstone implements a multi-tenant Expense & Budget Management System using PostgreSQL as the primary relational database and Redis as a caching layer.

The project demonstrates the complete database development lifecycle:

* requirements analysis
* ER modeling
* versioned schema migrations
* relational database design
* Redis integration
* query optimization
* audit logging
* Row-Level Security
* least-privilege security
* database backup
* restore testing
* technical documentation
* final presentation

## Technology Stack

* PostgreSQL
* Redis
* Flyway
* SQL
* Git/GitHub
* dbdiagram.io

## Architecture

```text
                    Application
                         |
              +----------+----------+
              |                     |
              v                     v
        PostgreSQL                Redis
       System of Record           Cache
              |
       +------+------+
       |             |
   Application     Audit
      Data          Logs
```

## Database Entities

### users

Stores application users.

### budgets

Stores budgets belonging to users.

### categories

Stores expense categories.

### expenses

Stores individual expenses connected to budgets and categories.

### audit_logs

Stores changes to critical records.

## Migration Order

```text
V1__core_tables.sql
        ↓
V2__indexes.sql
        ↓
V3__audit_and_triggers.sql
        ↓
V4__row_level_security.sql
        ↓
V5__seed_demo_data.sql
```

The database is designed to be built using:

```bash
flyway clean migrate
```

## NoSQL Design

Redis is used for frequently accessed budget summaries.

PostgreSQL remains the authoritative source of data.

Redis provides temporary caching so repeated summary requests do not always require the same PostgreSQL aggregation.

## Security

The project implements:

* least-privilege roles
* Row-Level Security
* password hashing
* audit logging
* parameterized queries
* protected database credentials
* backup and restore verification

## Query Optimization

Optimization evidence is stored in:

```text
optimization/
```

Each optimization documents:

1. Query
2. Before plan
3. Change
4. After plan
5. Actual result

Execution times are based on real `EXPLAIN ANALYZE` measurements rather than estimated values.

## Backup

The project uses:

```bash
pg_dump -Fc -f backups/capstone_$(date +%F).dump capstone
```

The backup is restored into a separate test database to verify recoverability.

## Screenshots

Screenshots are stored in:

```text
screenshots/
```

Important evidence includes:

1. ER diagram
2. Flyway migration
3. Created tables
4. Audit trigger
5. RLS test
6. Redis
7. Before optimization
8. After optimization
9. Backup
10. Restore test
11. Security roles

## Final Presentation

The final walkthrough is available in:

```text
presentation/capstone-walkthrough.md
```

## Project Conclusion

This project demonstrates a complete database project lifecycle from requirements and data modeling through migrations, NoSQL integration, optimization, security, backup, recovery, and technical presentation.

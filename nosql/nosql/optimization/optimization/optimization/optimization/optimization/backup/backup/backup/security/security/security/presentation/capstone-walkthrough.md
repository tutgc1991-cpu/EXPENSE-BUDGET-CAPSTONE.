# Expense & Budget Management System

## Slide 1 — Title

**Expense & Budget Management System**

Student: Tut Gatluak Chol

Technology:

* PostgreSQL
* Redis
* Flyway

---

## Slide 2 — Problem

The system provides a structured way to manage:

* users
* budgets
* expenses
* categories
* spending summaries

The design focuses on data integrity, security, performance, and recoverability.

---

## Slide 3 — Architecture

```text
Application
     |
     +-----------> PostgreSQL
     |                |
     |                +-- Users
     |                +-- Budgets
     |                +-- Expenses
     |                +-- Categories
     |                +-- Audit Logs
     |
     +-----------> Redis
                      |
                      +-- Cached Budget Summaries
```

PostgreSQL is the source of truth.

Redis is used as a cache.

---

## Slide 4 — ER Diagram

Show the completed ER diagram.

Explain:

* entities
* attributes
* primary keys
* foreign keys
* one-to-many relationships
* cardinalities

---

## Slide 5 — Migrations

The database is created using ordered migrations:

```text
V1 Core Tables
V2 Indexes
V3 Audit and Triggers
V4 Row-Level Security
V5 Demo Data
```

The migration process is tested using:

```bash
flyway clean migrate
```

---

## Slide 6 — Redis

Redis stores frequently requested budget summaries.

Example:

```text
budget:1:summary
```

PostgreSQL remains the permanent source of truth.

Redis reduces repeated work for frequently requested cached information.

---

## Slide 7 — Security

Security controls include:

* least-privilege database roles
* Row-Level Security
* password hashing
* audit logging
* parameterized queries
* protected credentials

The application does not use a PostgreSQL superuser.

---

## Slide 8 — Query Optimization

Show the actual:

```text
BEFORE EXPLAIN ANALYZE
```

Then explain:

* query problem
* index/change made
* reason for the change

Then show:

```text
AFTER EXPLAIN ANALYZE
```

Use actual measured execution times.

---

## Slide 9 — Backup and Recovery

Backup:

```bash
pg_dump -Fc -f backups/capstone_$(date +%F).dump capstone
```

Restore testing uses a separate database:

```text
capstone_restore_test
```

Show the backup and restore screenshots.

---

## Slide 10 — Lessons Learned

The project demonstrates that a production-style database system requires more than creating tables.

Important lessons include:

* design before implementation
* version database changes
* choose NoSQL only where it solves a specific problem
* measure optimization instead of assuming it works
* enforce security at the database level
* test backups by actually restoring them
* document decisions throughout the project

---

## Slide 11 — Final Result

The completed system demonstrates:

* requirements analysis
* ER modeling
* PostgreSQL migrations
* Redis integration
* query optimization
* audit logging
* Row-Level Security
* least-privilege security
* backup and recovery
* technical documentation

Thank you.



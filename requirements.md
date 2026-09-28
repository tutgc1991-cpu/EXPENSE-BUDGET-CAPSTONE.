# Expense & Budget Management System

**Student:** Tut Gatluak Chol
**Date:** September 28, 2026
**Project:** Expense & Budget Management Capstone

## 1. Project Overview

The Expense & Budget Management System is a multi-tenant application that allows users to create budgets, organize expenses into categories, record transactions, and monitor spending.

The system uses PostgreSQL as the primary relational database because the application requires reliable transactions, relationships, constraints, reporting, security controls, and auditability.

Redis is integrated as a NoSQL component for caching frequently requested budget summaries and reducing repeated database reads.

## 2. Functional Requirements

The system shall allow users to:

1. Create and manage user accounts.
2. Create budgets for specific periods.
3. Assign budgets to users.
4. Create expense categories.
5. Record expenses against budgets.
6. Associate expenses with categories.
7. View total spending for a budget.
8. View spending by category.
9. View remaining budget amounts.
10. Update and delete expenses.
11. Maintain an audit history of important data changes.
12. Restrict users so they can only access their own budget and expense data.
13. Cache frequently requested summaries using Redis.
14. Back up the PostgreSQL database.
15. Test restoration of a database backup.

## 3. Non-Functional Requirements

### Performance

Frequently executed analytical queries should be optimized using appropriate indexes and query design. Performance claims must be supported using EXPLAIN ANALYZE before-and-after evidence.

### Security

The application must follow least-privilege principles. Application users must not connect using a PostgreSQL superuser account.

Row-Level Security will prevent users from accessing another user's sensitive budget and expense records.

Sensitive account information should not be stored as plain text where hashing or encryption is appropriate.

### Reliability

The PostgreSQL database must support regular backups. At least one backup must be restored into a separate test database to verify that the backup is usable.

### Maintainability

Database changes must be implemented using ordered, versioned migrations so that a clean database can be created consistently.

## 4. Main Entities

The system contains the following entities:

* users
* budgets
* categories
* expenses
* audit_logs

## 5. Relationships

A user can have many budgets.

A budget belongs to one user.

A user can have many expenses through their budgets.

A budget can contain many expenses.

A category can contain many expenses.

An expense belongs to one budget and one category.

An audit log records changes made to important records.

## 6. PostgreSQL Responsibilities

PostgreSQL will provide:

* relational data storage
* primary and foreign keys
* constraints
* indexes
* transactions
* audit triggers
* Row-Level Security
* analytical queries
* backups and restore testing

## 7. Redis Responsibilities

Redis will be used for caching frequently requested budget summaries.

For example, a calculated budget summary can be stored using a key such as:

`budget:42:summary`

This avoids repeatedly calculating the same summary from PostgreSQL when the data has not changed.

Redis is not the source of truth. PostgreSQL remains the authoritative database.

## 8. Success Criteria

The project is successful when:

* the database can be built using versioned migrations;
* the ER diagram correctly represents the database;
* PostgreSQL and Redis have clearly defined responsibilities;
* audit logging works;
* Row-Level Security prevents unauthorized tenant access;
* optimized queries have measurable before-and-after evidence;
* a PostgreSQL backup can be created;
* the backup can be restored successfully;
* security checks pass;
* and the complete architecture can be explained in a short presentation.

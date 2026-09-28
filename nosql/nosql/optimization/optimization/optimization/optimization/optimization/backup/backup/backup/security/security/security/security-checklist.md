# Security Checklist

## 1. Least-Privilege Roles

* [ ] Application does not use a PostgreSQL superuser.
* [ ] Application role has only required permissions.
* [ ] Read-only role has only SELECT permissions.

## 2. Row-Level Security

* [ ] RLS enabled on budgets.
* [ ] RLS enabled on expenses.
* [ ] Users cannot access another user's budget.
* [ ] Users cannot access expenses belonging to another user's budget.

## 3. Sensitive Data

* [ ] Passwords are never stored as plain text.
* [ ] Password hashes are used.
* [ ] Database credentials are not committed to GitHub.
* [ ] Secret values are stored outside source control.

## 4. Audit Logging

* [ ] Expense INSERT operations are audited.
* [ ] Expense UPDATE operations are audited.
* [ ] Expense DELETE operations are audited.
* [ ] Old and new values are recorded where appropriate.

## 5. Parameterized Queries

* [ ] User input is passed as parameters.
* [ ] SQL strings are not constructed using untrusted input.

## 6. Backup

* [ ] PostgreSQL backup created.
* [ ] Backup file verified.
* [ ] Backup restored to a separate test database.
* [ ] Restored tables verified.

## Final Verification

Date tested: __________________

Database: `capstone`

Restore database: `capstone_restore_test`

Result: ______________________

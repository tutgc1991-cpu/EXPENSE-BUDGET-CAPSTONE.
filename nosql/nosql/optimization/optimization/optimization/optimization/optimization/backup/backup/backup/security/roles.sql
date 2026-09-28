CREATE ROLE capstone_app
LOGIN
PASSWORD 'CHANGE_THIS_PASSWORD';

CREATE ROLE capstone_readonly
LOGIN
PASSWORD 'CHANGE_THIS_PASSWORD';

REVOKE ALL ON DATABASE capstone FROM PUBLIC;

GRANT CONNECT ON DATABASE capstone
TO capstone_app;

GRANT CONNECT ON DATABASE capstone
TO capstone_readonly;

GRANT USAGE ON SCHEMA public
TO capstone_app;

GRANT USAGE ON SCHEMA public
TO capstone_readonly;

GRANT SELECT, INSERT, UPDATE, DELETE
ON users, budgets, categories, expenses
TO capstone_app;

GRANT SELECT
ON users, budgets, categories, expenses
TO capstone_readonly;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO capstone_app;

ALTER TABLE users FORCE ROW LEVEL SECURITY;
ALTER TABLE budgets FORCE ROW LEVEL SECURITY;
ALTER TABLE expenses FORCE ROW LEVEL SECURITY;
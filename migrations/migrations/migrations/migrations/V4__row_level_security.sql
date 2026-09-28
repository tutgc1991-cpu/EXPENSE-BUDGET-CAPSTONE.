ALTER TABLE budgets ENABLE ROW LEVEL SECURITY;
ALTER TABLE expenses ENABLE ROW LEVEL SECURITY;

CREATE POLICY budgets_select_policy
ON budgets
FOR SELECT
USING (
    user_id = NULLIF(current_setting('app.user_id', true), '')::BIGINT
);

CREATE POLICY budgets_insert_policy
ON budgets
FOR INSERT
WITH CHECK (
    user_id = NULLIF(current_setting('app.user_id', true), '')::BIGINT
);

CREATE POLICY budgets_update_policy
ON budgets
FOR UPDATE
USING (
    user_id = NULLIF(current_setting('app.user_id', true), '')::BIGINT
)
WITH CHECK (
    user_id = NULLIF(current_setting('app.user_id', true), '')::BIGINT
);

CREATE POLICY budgets_delete_policy
ON budgets
FOR DELETE
USING (
    user_id = NULLIF(current_setting('app.user_id', true), '')::BIGINT
);

CREATE POLICY expenses_select_policy
ON expenses
FOR SELECT
USING (
    budget_id IN (
        SELECT id
        FROM budgets
        WHERE user_id =
            NULLIF(current_setting('app.user_id', true), '')::BIGINT
    )
);

CREATE POLICY expenses_insert_policy
ON expenses
FOR INSERT
WITH CHECK (
    budget_id IN (
        SELECT id
        FROM budgets
        WHERE user_id =
            NULLIF(current_setting('app.user_id', true), '')::BIGINT
    )
);

CREATE POLICY expenses_update_policy
ON expenses
FOR UPDATE
USING (
    budget_id IN (
        SELECT id
        FROM budgets
        WHERE user_id =
            NULLIF(current_setting('app.user_id', true), '')::BIGINT
    )
)
WITH CHECK (
    budget_id IN (
        SELECT id
        FROM budgets
        WHERE user_id =
            NULLIF(current_setting('app.user_id', true))::BIGINT
    )
);

CREATE POLICY expenses_delete_policy
ON expenses
FOR DELETE
USING (
    budget_id IN (
        SELECT id
        FROM budgets
        WHERE user_id =
            NULLIF(current_setting('app.user_id', true), '')::BIGINT
    )
);
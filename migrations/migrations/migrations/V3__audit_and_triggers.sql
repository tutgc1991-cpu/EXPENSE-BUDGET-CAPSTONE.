CREATE TABLE IF NOT EXISTS audit_logs (
    id BIGSERIAL PRIMARY KEY,
    table_name TEXT NOT NULL,
    record_id BIGINT NOT NULL,
    operation TEXT NOT NULL,
    changed_by BIGINT,
    old_data JSONB,
    new_data JSONB,
    changed_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION audit_changes()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id BIGINT;
BEGIN
    v_user_id := NULLIF(
        current_setting('app.user_id', true),
        ''
    )::BIGINT;

    IF TG_OP = 'INSERT' THEN

        INSERT INTO audit_logs (
            table_name,
            record_id,
            operation,
            changed_by,
            old_data,
            new_data
        )
        VALUES (
            TG_TABLE_NAME,
            NEW.id,
            TG_OP,
            v_user_id,
            NULL,
            to_jsonb(NEW)
        );

        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN

        INSERT INTO audit_logs (
            table_name,
            record_id,
            operation,
            changed_by,
            old_data,
            new_data
        )
        VALUES (
            TG_TABLE_NAME,
            NEW.id,
            TG_OP,
            v_user_id,
            to_jsonb(OLD),
            to_jsonb(NEW)
        );

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO audit_logs (
            table_name,
            record_id,
            operation,
            changed_by,
            old_data,
            new_data
        )
        VALUES (
            TG_TABLE_NAME,
            OLD.id,
            TG_OP,
            v_user_id,
            to_jsonb(OLD),
            NULL
        );

        RETURN OLD;
    END IF;

    RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS trg_budgets_audit ON budgets;

DROP TRIGGER IF EXISTS trg_expenses_audit ON expenses;

CREATE TRIGGER trg_budgets_audit
AFTER INSERT OR UPDATE OR DELETE
ON budgets
FOR EACH ROW
EXECUTE FUNCTION audit_changes();

CREATE TRIGGER trg_expenses_audit
AFTER INSERT OR UPDATE OR DELETE
ON expenses
FOR EACH ROW
EXECUTE FUNCTION audit_changes();
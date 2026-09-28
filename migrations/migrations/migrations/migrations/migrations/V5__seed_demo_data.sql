INSERT INTO users (
    full_name,
    email,
    password_hash
)
VALUES
(
    'Tut Gatluak Chol',
    'tut@example.com',
    '$2b$12$example_hash_for_demo_only'
),
(
    'Demo User',
    'demo@example.com',
    '$2b$12$another_example_hash_for_demo_only'
);

INSERT INTO categories (name)
VALUES
('Food'),
('Transport'),
('Rent'),
('Utilities'),
('Education'),
('Entertainment'),
('Savings');

INSERT INTO budgets (
    user_id,
    name,
    amount,
    start_date,
    end_date
)
VALUES
(
    1,
    'September 2026 Budget',
    50000.00,
    '2026-09-01',
    '2026-09-30'
),
(
    2,
    'September 2026 Budget',
    75000.00,
    '2026-09-01',
    '2026-09-30'
);

INSERT INTO expenses (
    budget_id,
    category_id,
    amount,
    description,
    expense_date
)
VALUES
(1, 1, 5000.00, 'Monthly food expenses', '2026-09-03'),
(1, 2, 3000.00, 'Transportation', '2026-09-05'),
(1, 3, 20000.00, 'Monthly rent', '2026-09-01'),
(1, 4, 4000.00, 'Electricity and water', '2026-09-08'),
(1, 6, 5000.00, 'Entertainment', '2026-09-12'),
(1, 5, 10000.00, 'Training materials', '2026-09-15'),
(1, 7, 5000.00, 'Monthly savings', '2026-09-20'),

(2, 1, 7000.00, 'Food expenses', '2026-09-04'),
(2, 2, 5000.00, 'Transportation', '2026-09-06'),
(2, 4, 6000.00, 'Utilities', '2026-09-10');
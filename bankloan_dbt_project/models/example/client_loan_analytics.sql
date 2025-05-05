WITH loan_summary AS (
    SELECT
        "Region",
        COUNT(loan_id) AS total_loans,
        SUM(amount) AS total_loan_amount,
        AVG(amount) AS avg_loan_amount,
        AVG(duration) AS avg_loan_duration,
        AVG(payments) AS avg_monthly_payment,
        SUM(CASE WHEN isdebt = 'Yes' THEN 1 ELSE 0 END) AS total_loans_in_debt
    FROM {{ ref('client_loan') }}
    GROUP BY "Region"
)

SELECT
    "Region",
    total_loans,
    total_loan_amount,
    avg_loan_amount,
    avg_loan_duration,
    avg_monthly_payment,
    total_loans_in_debt,
    ROUND((total_loans_in_debt * 1.0 / total_loans) * 100, 2) AS debt_ratio_percentage
FROM loan_summary
ORDER BY total_loans DESC;
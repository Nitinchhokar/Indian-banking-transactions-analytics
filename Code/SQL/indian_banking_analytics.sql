CREATE DATABASE IF NOT EXISTS indian_banking_analytics;

USE indian_banking_analytics;

SHOW TABLES;

SELECT *
FROM bank_data
limit 5;

# 1. Overall Transaction Summary

SELECT
    COUNT(*) AS total_transactions,
    SUM(transaction_amount) AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount,
    MIN(transaction_amount) AS minimum_transaction_amount,
    MAX(transaction_amount) AS maximum_transaction_amount
FROM bank_data;

# 2. Transaction Status Analysis

SELECT
    transaction_status,
    COUNT(*) AS total_transactions,
    ROUND(
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),
        2
    ) AS percentage
FROM bank_data
GROUP BY transaction_status
ORDER BY total_transactions DESC;

# 3. Transaction Type Analysis

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),2 ) AS percentage
FROM bank_data
GROUP BY transaction_type
ORDER BY total_transactions DESC;

# 4. Monthly Transaction Trends

SELECT
    DATE_FORMAT(transaction_datetime, '%Y-%m') AS transaction_month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount
FROM bank_data
GROUP BY DATE_FORMAT(transaction_datetime, '%Y-%m')
ORDER BY transaction_month;

# 5. Transaction Channel Analysis

SELECT
    channel,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),2 ) AS percentage
FROM bank_data
GROUP BY channel
ORDER BY total_transactions DESC;

# 6. Merchant Category Analysis

SELECT
    merchant_category,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),2 ) AS percentage
FROM bank_data
GROUP BY merchant_category
ORDER BY total_transactions DESC;

# 7. Account Type Analysis

SELECT
    account_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),2 ) AS percentage
FROM bank_data
GROUP BY account_type
ORDER BY total_transactions DESC;

# 8. State-wise Transaction Analysis

SELECT
    state,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),2 ) AS percentage
FROM bank_data
GROUP BY state
ORDER BY total_transactions DESC;

# 9. Top 10 Most Active Customers

SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount
FROM bank_data
GROUP BY customer_id
ORDER BY total_transactions DESC
LIMIT 10; 

# 10. Loan Type Analysis

SELECT
    loan_type,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),2 ) AS percentage
FROM bank_data
GROUP BY loan_type
ORDER BY total_transactions DESC;

# 11. Overall Fraud Analysis

SELECT
    is_fraud,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data),
        2
    ) AS transaction_percentage
FROM bank_data
GROUP BY is_fraud
ORDER BY is_fraud;

# 12. Advanced Fraud Analysis by State

SELECT
    state,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_fraud_amount,
    ROUND(AVG(transaction_amount), 2) AS avg_fraud_amount
FROM bank_data
WHERE is_fraud = 1
GROUP BY state
HAVING AVG(transaction_amount) > (
    SELECT AVG(transaction_amount)
    FROM bank_data
)
ORDER BY total_fraud_amount DESC;

# 13. Fraud Analysis by Transaction Type

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(CASE
        WHEN is_fraud = 1 THEN 1
        ELSE 0
    END) AS fraud_transactions,
    ROUND(
        SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS fraud_percentage,
    ROUND(
        SUM(CASE
            WHEN is_fraud = 1 THEN transaction_amount
            ELSE 0
        END),
        2
    ) AS total_fraud_amount
FROM bank_data
GROUP BY transaction_type
HAVING SUM(CASE
    WHEN is_fraud = 1 THEN 1
    ELSE 0
END) > 0

ORDER BY fraud_percentage DESC;

# 14. Advanced Transaction Direction Analysis

SELECT
    transaction_direction,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(transaction_amount), 2) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount
FROM bank_data
WHERE transaction_amount > (
    SELECT AVG(transaction_amount)
    FROM bank_data
)
AND transaction_direction IS NOT NULL
GROUP BY transaction_direction
HAVING COUNT(*) >= 100
ORDER BY total_amount DESC;


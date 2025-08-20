CREATE DATABASE personal_finance_db;

USE DATABASE personal_finance_db;

CREATE SCHEMA raw;
CREATE SCHEMA staging;
CREATE SCHEMA marts;

SHOW ROLES;

SHOW WAREHOUSES;
use schema raw;

CREATE OR REPLACE TABLE transactions_raw (
    date STRING,
    transaction_description STRING,
    category STRING,
    amount FLOAT,
    type STRING
);


SELECT *
FROM staging.stg_transactions
LIMIT 10;

SELECT DISTINCT date
FROM raw.transactions_raw
LIMIT 10;

SELECT *
FROM staging.stg_transactions
WHERE NOT (transaction_amount > 0)

SELECT *
FROM staging.stg_transactions
WHERE amount <= 0 OR amount IS NULL;

use schema staging;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'STAGING'
  AND table_name = 'STG_TRANSACTIONS';

-- Check standardized category and type
SELECT DISTINCT category, type FROM stg_transactions;

-- Verify positive amounts
SELECT MIN(transaction_amount), MAX(transaction_amount) FROM stg_transactions;

-- Preview sample rows
SELECT * FROM stg_transactions LIMIT 40;

DROP SCHEMA IF EXISTS staging CASCADE;
DROP VIEW IF EXISTS marts.mart_income_vs_expense_trend;

SELECT *
FROM marts.mart_current_month_summary
LIMIT 20;

SELECT *
FROM marts.mart_category_summary
LIMIT 20;


SELECT *
FROM marts.mart_top_expense_categories_ytd
LIMIT 20;


SELECT *
FROM marts.mart_monthly_summary
LIMIT 20;


SELECT *
FROM marts.mart_top5_months_income
LIMIT 20;
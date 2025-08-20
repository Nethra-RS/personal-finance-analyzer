-- models/marts/mart_monthly_category_summary.sql

with base as (
    select
        date_trunc('month', transaction_date) as month,
        category,
        sum(case when type='EXPENSE' then transaction_amount else 0 end) as total_expense,
        sum(case when type='INCOME' then transaction_amount else 0 end) as total_income
    from {{ source('staging', 'stg_transactions') }}
    group by 1,2
)

select
    month,
    category,
    total_expense,
    total_income,
    
from base
order by month, category

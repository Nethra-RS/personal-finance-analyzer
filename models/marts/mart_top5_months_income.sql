-- models/marts/mart_top5_months_income.sql

with monthly_income as (
    select
        date_trunc('month', transaction_date) as month,
        sum(case when type='INCOME' then transaction_amount else 0 end) as total_income
    from {{ source('staging', 'stg_transactions') }}
    group by 1
)

select
    month,
    total_income
from monthly_income
order by total_income desc
limit 5

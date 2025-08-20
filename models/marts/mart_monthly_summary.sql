-- models/marts/mart_monthly_summary.sql

select
    date_trunc('month', transaction_date) as month,
    sum(case when type='INCOME' then transaction_amount else 0 end) as total_income,
    sum(case when type='EXPENSE' then transaction_amount else 0 end) as total_expense,
    sum(case when type='INCOME' then transaction_amount else 0 end) -
    sum(case when type='EXPENSE' then transaction_amount else 0 end) as net_savings
from {{ source('staging', 'stg_transactions') }}
group by 1
order by month

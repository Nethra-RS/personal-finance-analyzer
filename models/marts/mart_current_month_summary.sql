-- models/marts/mart_current_month_summary.sql

with latest_month as (
    select max(date_trunc('month', transaction_date)) as month
    from {{ source('staging', 'stg_transactions') }}
)

select
    lm.month,
    sum(case when type='INCOME' then transaction_amount else 0 end) as total_income,
    sum(case when type='EXPENSE' then transaction_amount else 0 end) as total_expense,
    greatest(sum(case when type='INCOME' then transaction_amount else 0 end) -
    sum(case when type='EXPENSE' then transaction_amount else 0 end),0) as net_savings
from {{ source('staging', 'stg_transactions') }} t
cross join latest_month lm
where date_trunc('month', t.transaction_date) = lm.month
group by lm.month

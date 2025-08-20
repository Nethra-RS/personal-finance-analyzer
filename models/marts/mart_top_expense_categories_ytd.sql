-- models/marts/mart_top5_monthly_expenses.sql

with monthly_category as (
    select
        date_trunc('month', transaction_date) as month,
        category,
        sum(case when type='EXPENSE' then transaction_amount else 0 end) as total_expense
    from {{ source('staging', 'stg_transactions') }}
    group by 1,2
),

ranked as (
    select
        *,
        row_number() over (partition by month order by total_expense desc) as rank
    from monthly_category
)

select
    month,
    category,
    total_expense
from ranked
where rank <= 5
order by month, total_expense desc

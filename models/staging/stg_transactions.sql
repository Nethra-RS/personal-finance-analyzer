

with source as (
    select *
    from {{ source('raw', 'transactions_raw') }}
)

select
    row_number() over(order by try_to_date(date, 'YYYY-MM-DD')) as transaction_id, -- unique ID
    try_to_date(date, 'YYYY-MM-DD') as transaction_date,                           -- parse dates
    initcap(transaction_description) as description,                                -- capitalize, keep nulls
    upper(category) as category,                                                  -- standardize category
    round(cast(amount as numeric), 2) as transaction_amount,                      -- numeric, 2 decimals
    upper(type) as type                                                           -- standardize type
from source
where amount is not null and amount > 0                                         -- drop only invalid amounts

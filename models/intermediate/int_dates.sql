select
    row_number() over (
        order by date_day
    ) as date_id,

    date_day,

    year(date_day) as year,
    quarter(date_day) as quarter,
    month(date_day) as month,
    monthname(date_day) as month_name,
    day(date_day) as day_of_month,
    dayofweek(date_day) as day_of_week

from (
    select distinct
        order_date as date_day
    from {{ ref('stg_superstore') }}
    where order_date is not null

    union

    select distinct
        ship_date as date_day
    from {{ ref('stg_superstore') }}
    where ship_date is not null
)
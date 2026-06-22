select
    date_id,
    date_day,
    year,
    quarter,
    month,
    month_name,
    day_of_month,
    day_of_week

from {{ ref('int_dates') }}
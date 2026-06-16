select
    row_id::integer as row_id,
    order_id::varchar as order_id,
    order_date::date as order_date,
    ship_date::date as ship_date,
    ship_mode::varchar as ship_mode,

    customer_id::varchar as customer_id,
    customer_name::varchar as customer_name,
    segment::varchar as segment,

    country::varchar as country,
    city::varchar as city,
    state::varchar as state,
    postal_code::varchar as postal_code,
    region::varchar as region,

    product_id::varchar as product_id,
    category::varchar as category,
    sub_category::varchar as sub_category,
    product_name::varchar as product_name,

    sales::number(18, 4) as sales,
    quantity::integer as quantity,
    discount::number(18, 4) as discount,
    profit::number(18, 4) as profit

from {{ source('raw', 'SAMPLESUPERSTORE') }}
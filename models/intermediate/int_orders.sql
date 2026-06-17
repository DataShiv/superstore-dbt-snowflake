select
    o.order_id,
    od.date_id as order_date_id,
    sd.date_id as ship_date_id,
    sm.ship_mode_id,
    o.customer_id,
    l.location_id

from (
    select
        trim(order_id) as order_id,
        order_date,
        ship_date,
        trim(ship_mode) as ship_mode,
        trim(customer_id) as customer_id,
        trim(country) as country_name,
        trim(region) as region_name,
        trim(state) as state_name,
        trim(city) as city,
        postal_code::varchar as postal_code,
        row_id

    from {{ ref('stg_superstore') }}

    where order_id is not null

    qualify row_number() over (
        partition by trim(order_id)
        order by row_id
    ) = 1
) as o

left join {{ ref('int_dates') }} as od
    on o.order_date = od.date_day

left join {{ ref('int_dates') }} as sd
    on o.ship_date = sd.date_day

left join {{ ref('int_ship_modes') }} as sm
    on o.ship_mode = sm.ship_mode

left join {{ ref('int_locations') }} as l
    on o.city = l.city
   and o.postal_code = l.postal_code
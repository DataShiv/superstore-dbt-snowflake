select
    c.customer_id,
    c.customer_name,
    s.segment_id

from (
    select
        trim(customer_id) as customer_id,
        trim(customer_name) as customer_name,
        trim(segment) as segment_name

    from {{ ref('stg_superstore') }}

    where customer_id is not null

    qualify row_number() over (
        partition by trim(customer_id)
        order by trim(customer_name), trim(segment)
    ) = 1
) as c

left join {{ ref('int_segments') }} as s
    on c.segment_name = s.segment_name
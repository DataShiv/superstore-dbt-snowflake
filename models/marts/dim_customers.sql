select
    c.customer_id,
    c.customer_name,

    s.segment_id,
    s.segment_name

from {{ ref('int_customers') }} as c

left join {{ ref('int_segments') }} as s
    on c.segment_id = s.segment_id
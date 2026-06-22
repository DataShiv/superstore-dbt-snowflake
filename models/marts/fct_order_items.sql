select
    oi.row_id,

    o.order_id,
    o.order_date_id,
    o.ship_date_id,

    o.customer_id,
    o.location_id,
    o.ship_mode_id,

    oi.product_id,

    oi.sales,
    oi.quantity,
    oi.discount,
    oi.profit

from {{ ref('int_order_items') }} as oi

left join {{ ref('int_orders') }} as o
    on oi.order_id = o.order_id
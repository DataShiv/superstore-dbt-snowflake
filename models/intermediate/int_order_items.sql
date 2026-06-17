select
    row_id,
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit

from {{ ref('stg_superstore') }}

where row_id is not null
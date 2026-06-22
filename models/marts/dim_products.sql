select
    p.product_id,
    p.product_name,

    sc.sub_category_id,
    sc.sub_category_name,

    c.category_id,
    c.category_name

from {{ ref('int_products') }} as p

left join {{ ref('int_sub_categories') }} as sc
    on p.sub_category_id = sc.sub_category_id

left join {{ ref('int_categories') }} as c
    on sc.category_id = c.category_id
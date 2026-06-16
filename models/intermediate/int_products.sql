select
    product_id,
    product_name,
    sub_category_id

from (
    select
        trim(product_id) as product_id,
        trim(product_name) as product_name,
        trim(category) as category_name,
        trim(sub_category) as sub_category_name,

        row_number() over (
            partition by trim(product_id)
            order by trim(product_name)
        ) as row_num

    from {{ ref('stg_superstore') }}

    where product_id is not null
) as p

left join {{ ref('int_sub_categories') }} as sc
    on p.sub_category_name = sc.sub_category_name

where row_num = 1
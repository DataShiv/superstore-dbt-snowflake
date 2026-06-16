select
    row_number() over (order by category_name) as category_id,
    category_name

from (
    select distinct
        trim(category) as category_name
    from {{ ref('stg_superstore') }}
    where category is not null
)
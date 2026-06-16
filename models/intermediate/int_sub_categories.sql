with sub_categories as (

    select distinct
        trim(category) as category_name,
        trim(sub_category) as sub_category_name

    from {{ ref('stg_superstore') }}

    where category is not null
      and sub_category is not null

),

categories as (

    select *
    from {{ ref('int_categories') }}

)

select
    row_number() over (
        order by s.category_name, s.sub_category_name
    ) as sub_category_id,

    c.category_id,
    s.sub_category_name,
    s.category_name

from sub_categories as s

left join categories as c
    on s.category_name = c.category_name
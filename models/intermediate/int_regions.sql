select
    row_number() over (
        order by r.country_name, r.region_name
    ) as region_id,

    c.country_id,
    r.region_name

from (
    select distinct
        trim(country) as country_name,
        trim(region) as region_name

    from {{ ref('stg_superstore') }}

    where country is not null
      and region is not null
) as r

left join {{ ref('int_countries') }} as c
    on r.country_name = c.country_name
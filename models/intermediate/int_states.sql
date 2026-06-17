select
    row_number() over (
        order by s.country_name, s.region_name, s.state_name
    ) as state_id,

    r.region_id,
    s.state_name

from (
    select distinct
        trim(country) as country_name,
        trim(region) as region_name,
        trim(state) as state_name

    from {{ ref('stg_superstore') }}

    where country is not null
      and region is not null
      and state is not null
) as s

left join {{ ref('int_regions') }} as r
    on s.region_name = r.region_name

left join {{ ref('int_countries') }} as c
    on s.country_name = c.country_name
   and r.country_id = c.country_id
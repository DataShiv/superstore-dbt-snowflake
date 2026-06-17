select
    row_number() over (
        order by l.country_name, l.region_name, l.state_name, l.city, l.postal_code
    ) as location_id,

    st.state_id,
    l.city,
    l.postal_code

from (
    select distinct
        trim(country) as country_name,
        trim(region) as region_name,
        trim(state) as state_name,
        trim(city) as city,
        postal_code::varchar as postal_code

    from {{ ref('stg_superstore') }}

    where country is not null
      and region is not null
      and state is not null
      and city is not null
) as l

left join {{ ref('int_states') }} as st
    on l.state_name = st.state_name

left join {{ ref('int_regions') }} as r
    on l.region_name = r.region_name
   and st.region_id = r.region_id

left join {{ ref('int_countries') }} as c
    on l.country_name = c.country_name
   and r.country_id = c.country_id
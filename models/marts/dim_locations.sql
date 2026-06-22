select
    l.location_id,

    l.city,
    l.postal_code,

    st.state_id,
    st.state_name,

    r.region_id,
    r.region_name,

    c.country_id,
    c.country_name

from {{ ref('int_locations') }} as l

left join {{ ref('int_states') }} as st
    on l.state_id = st.state_id

left join {{ ref('int_regions') }} as r
    on st.region_id = r.region_id

left join {{ ref('int_countries') }} as c
    on r.country_id = c.country_id
select
    row_number() over (
        order by country_name
    ) as country_id,

    country_name

from (
    select distinct
        trim(country) as country_name

    from {{ ref('stg_superstore') }}

    where country is not null
)
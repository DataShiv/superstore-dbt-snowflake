select
    row_number() over (
        order by ship_mode
    ) as ship_mode_id,

    ship_mode

from (
    select distinct
        trim(ship_mode) as ship_mode

    from {{ ref('stg_superstore') }}

    where ship_mode is not null
)
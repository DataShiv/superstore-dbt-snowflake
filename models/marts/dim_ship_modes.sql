select
    ship_mode_id,
    ship_mode

from {{ ref('int_ship_modes') }}
select
    row_number() over (
        order by segment_name
    ) as segment_id,

    segment_name

from (
    select distinct
        trim(segment) as segment_name

    from {{ ref('stg_superstore') }}

    where segment is not null
)
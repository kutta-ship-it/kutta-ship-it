{{ config(
    materialized='table',
    schema='STAGING'
) }}

select

    "MINE_ID" as mine_id,
    "MINE_NAME" as mine_name,
    "MINE_TYPE" as mine_type,
    "LOCATION" as location,
    "STATUS" as status,
    "OPENING_DATE" as opening_date

from {{ source(
    'mining_source',
    'MINE_MASTER'
) }}
{{ config(
    materialized='table',
    schema='CONSUMPTION'
) }}

select *

from {{ ref('stg_mine',
    schema='DBT_MINING_STAGING'
) }}
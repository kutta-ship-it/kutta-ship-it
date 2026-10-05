{{ config(
    materialized='table',
    schema='CONSUMPTION'
) }}

select *

from {{ ref('stg_warehouse',
    schema='DBT_MINING_STAGING'
) }}
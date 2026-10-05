{{ config(
    materialized='table',
    schema='CONSUMPTION'
) }}

select *

from {{ ref('stg_operator') }}
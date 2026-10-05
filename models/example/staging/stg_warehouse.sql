{{ config(
    materialized='table',
    schema='STAGING'
) }}

select

    "WAREHOUSE_ID" as warehouse_id,
    "WAREHOUSE_NAME" as warehouse_name,
    "LOCATION" as location,
    "CAPACITY_TONNES" as capacity_tonnes,
    "WAREHOUSE_MANAGER" as warehouse_manager

from {{ source(
    'mining_source',
    'WAREHOUSE_MASTER'
) }}
{{ config(
    materialized='table',
    schema='CONSUMPTION'
) }}

select

    extraction_date,
    mine_id,
    warehouse_id,
    operator,

    'COAL' as mineral_type,

    quantity_tonnes,
    total_cost,

    compliance_status

from {{ ref('stg_coal_mining') }}

union all

select

    extraction_date,
    mine_id,
    warehouse_id,
    operator,

    'IRON' as mineral_type,

    quantity_tonnes,
    total_cost,

    environmental_compliance
        as compliance_status

from {{ ref('stg_iron_mining') }}
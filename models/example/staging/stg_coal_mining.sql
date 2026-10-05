{{ config(
    materialized='table',
    schema='STAGING'
) }}

select

    "Unit_ID" as unit_id,
    "Mine_ID" as mine_id,
    "Warehouse_ID" as warehouse_id,
    "Coal_Type" as coal_type,
    "Mining_Method" as mining_method,

    to_date("Extraction_Date")
        as extraction_date,

    "Quantity_Tonnes"
        as quantity_tonnes,

    "Ash_Content_Percent"
        as ash_content_percent,

    "Sulfur_Content_Percent"
        as sulfur_content_percent,

    "Moisture_Content_Percent"
        as moisture_content_percent,

    "Calorific_Value_KCal_Kg"
        as calorific_value_kcal_kg,

    "Equipment_Used"
        as equipment_used,

    "Operator"
        as operator,

    "Location"
        as location,

    "Depth_Meters"
        as depth_meters,

    "Production_Cost_Per_Tonne"
        as production_cost_per_tonne,

    "Quantity_Tonnes"
    *
    "Production_Cost_Per_Tonne"
        as total_cost,

    "Transport_Mode"
        as transport_mode,

    "Quality_Grade"
        as quality_grade,

    "Compliance_Status"
        as compliance_status,

    "Safety_Incidents"
        as safety_incidents

from
{{ source(
    'mining_source',
    'COAL_MINING_OPERATIONS'
) }}
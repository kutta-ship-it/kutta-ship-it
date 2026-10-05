{{ config(
    materialized='table',
    schema='STAGING'
) }}

select

    "Unit_ID" as unit_id,
    "Mine_ID" as mine_id,
    "Warehouse_ID" as warehouse_id,

    "Ore_Type" as ore_type,
    "Iron_Grade" as iron_grade,

    to_date("Extraction_Date")
        as extraction_date,

    "Quantity_Tonnes"
        as quantity_tonnes,

    "Iron_Content_Percent"
        as iron_content_percent,

    "Silica_Content_Percent"
        as silica_content_percent,

    "Alumina_Content_Percent"
        as alumina_content_percent,

    "Phosphorus_Content_Percent"
        as phosphorus_content_percent,

    "Processing_Method"
        as processing_method,

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

    "Recovery_Rate_Percent"
        as recovery_rate_percent,

    "Stockpile_Quantity_Tonnes"
        as stockpile_quantity_tonnes,

    "Export_Destination"
        as export_destination,

    "Transport_Mode"
        as transport_mode,

    "Environmental_Compliance"
        as environmental_compliance,

    "Water_Usage_Cubic_Meters"
        as water_usage_cubic_meters,

    "Quantity_Tonnes"
    *
    "Production_Cost_Per_Tonne"
        as total_cost,

    "Quantity_Tonnes"
    *
    ("Iron_Content_Percent"/100)
        as recoverable_iron

from
{{ source(
    'mining_source',
    'IRON_MINING_OPERATIONS'
) }}
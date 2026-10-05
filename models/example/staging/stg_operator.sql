{{ config(
    materialized='table',
    schema='STAGING'
) }}

select

    "OPERATOR_ID" as operator_id,
    "OPERATOR_NAME" as operator_name,
    "HEADQUARTER" as headquarter,
    "LICENSE_NUMBER" as license_number,
    "CONTACT_EMAIL" as contact_email

from {{ source(
    'mining_source',
    'OPERATOR_MASTER'
) }}
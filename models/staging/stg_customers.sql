WITH source AS (
    SELECT * FROM {{ source('raw', 'jaffle_shop_customers')}}
),

renamed AS (
    SELECT
        "ID" as id,
        TRIM(UPPER("FIRST_NAME")) as first_name,
        TRIM(UPPER("LAST_NAME")) as last_name
    FROM source
)

SELECT * FROM renamed
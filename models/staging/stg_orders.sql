WITH source AS (
    SELECT * FROM {{source('raw', 'jaffle_shop_orders')}}
),

renamed AS (
    SELECT
        "ID" as id,
        "USER_ID" as user_id,
        "ORDER_DATE"::date as order_date,
        CASE
           WHEN "STATUS" = 'completed' THEN 1
            WHEN "STATUS" = 'canceled' THEN 0
            ELSE NULL
        END AS status
    FROM source
)

SELECT * FROM renamed
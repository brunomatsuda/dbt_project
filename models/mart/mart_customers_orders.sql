{{config(materialized='table')}}

WITH customers AS (
    SELECT * FROM {{ref('stg_customers')}}
),
orders AS (
    SELECT * FROM {{ref('stg_orders')}}
),

final as (
    SELECT
        "user_id",
        CONCAT("first_name", ' ', "last_name") AS "full_name",
        "order_date",
        "status"
    FROM customers as c
    INNER JOIN orders as o
    ON c.id = o.user_id
)
SELECT * FROM final
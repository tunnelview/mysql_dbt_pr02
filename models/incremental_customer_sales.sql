{{config(
  materialized='incremental',
  unique_key='customer_id',
  strategy='check'
)}}

SELECT
  customer_id,
  SUM(order_total) AS total_sales
FROM
  {{ ref('base_orders') }}
GROUP BY
  customer_id

{{ config(materialized='table') }}

SELECT 
c.customer_id, 
c.first_name, 
c.last_name, 
COUNT(o.order_id) AS order_count
FROM  {{ ref('stg_customers')}} c 
JOIN {{ ref('stg_orders')}} o 
ON c.customer_id = o.user_id
GROUP BY 
c.customer_id, 
c.first_name, 
c.last_name

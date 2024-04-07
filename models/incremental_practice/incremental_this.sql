--This is the second strategy for incremental

{{ config(materialized='incremental') }}



/*INSERT INTO analytics.incremental_this
SELECT *
FROM dbo.Orders
WHERE orders.order_datetime > (SELECT MAX(order_datetime) FROM analytics.incremental_this)  
*/


SELECT 
    *
FROM 
    dbo.Orders
{% if is_incremental() %}
WHERE 
    order_datetime > '{{dbt_utils.get_last_utc_time(this, 'order_datetime')}}' --(select max(LAST_UTC_TS) from {{ this }})
{% endif %}


--This is the second strategy for incremental

{{ config(materialized='incremental') }}
/*
select * from [dbo].[Orders] -- Here 
where {{this}}.order_datetime > max({{this}}.order_datetime
*/


INSERT INTO analytics.incremental_this
SELECT *
FROM dbo.Orders
WHERE orders.order_datetime > (SELECT MAX(order_datetime) FROM analytics.incremental_this)  


INSERT INTO
SELECT 
    *
FROM 
    dbo.Orders
{% if is_incremental() %}
WHERE 
    LAST_UTC_TS > '{{dbt_utils.get_last_utc_ts(this, 'LAST_UTC_TS')}}' --(select max(LAST_UTC_TS) from {{ this }})
{% endif %}
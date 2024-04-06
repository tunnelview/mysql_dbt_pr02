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


/*
SELECT 
    *
FROM 
    dbo.Orders
{% if is_incremental() %}
WHERE 
    orders.order_datetime > '{{dbt_utils.get_last_utc_ts(this, 'orders.order_datetime')}}' --(select max(LAST_UTC_TS) from {{ this }})
{% endif %}
*/

/*{{ config(
    materialized='incremental'
    , incremental_strategy='append'
)}}

select *
from source_table
{% if is_incremental() %}
    where extract(order_datetime from order_datetime) in ({{ var('today_and_last_week') | join(',') }})
{% endif %}
*/
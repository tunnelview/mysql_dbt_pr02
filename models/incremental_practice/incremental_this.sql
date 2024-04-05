--This is the second strategy for incremental

{{ config(materialized='incremental') }}
/*
select * from [dbo].[Orders] -- Here 
where {{this}}.order_datetime > max({{this}}.order_datetime
*/


INSERT INTO [analytics].[incremental_this]
SELECT *
FROM dbo.Orders
WHERE dbo.[Orders].order_datetime > (SELECT MAX(order_datetime) FROM [analytics].[incremental_this])
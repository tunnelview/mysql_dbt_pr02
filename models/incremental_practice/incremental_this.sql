--This is the second strategy for incremental

{{ config(materialized='incremental') }}

select * from [dbo].[Orders] -- Here 
where order_datetime > max(order_datetime) from {{this}}
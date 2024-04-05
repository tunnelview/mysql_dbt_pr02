--This is the second strategy for incremental

{{ config(materialized='incremental') }}

select * from [dbo].[Orders] -- Here 
where {{this}}.order_datetime > max({{this}}.order_datetime
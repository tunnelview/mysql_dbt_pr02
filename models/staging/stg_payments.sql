
{{ config(materialized='table') }}

with payments as (
    
    select
        id as payment_id,
        order_id,
        payment_method,
      {{ amount_dollars() }} as amount




    from dbo.raw_payments
)

select * from payments
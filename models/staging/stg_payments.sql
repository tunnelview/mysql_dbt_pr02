
{{ config(materialized='table') }}

with payments as (
    
    select
        id as payment_id,
        order_id,
        payment_method,
      {{ cents_to_dollars('amount', 3) }} as amount
      /* There is something called 
      1. positioal Argument, which takes the position of the parameter passed, therefore, we don't have to mention decimal_places 
      explicitly
      2. Keyword Argument like column_name such as decimal_places
      3. default argument - Incase the user is not passing any parameter then it will take the default parameter*/

    from dbo.raw_payments
)

select * from payments



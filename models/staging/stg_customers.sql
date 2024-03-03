with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from dbo.raw_customers
)

select * from customers
with customers as(
    select * from {{ref('stg__customers')}}
),
orders as(
    select * from {{ref('stg__orders')}}
)

select customers.customer_id, first_name, last_name, order_id, order_date, status from customers
inner join orders 
on customers.customer_id = orders.customer_id
with payment as(
    select * from {{ref('stg__payment')}}
),
orders as(
    select * from {{ref('stg__orders')}}
)

select customer_id, orders.order_id, order_date, payment_method, amount, status from orders
inner join payment 
on orders.order_id = payment.order_id
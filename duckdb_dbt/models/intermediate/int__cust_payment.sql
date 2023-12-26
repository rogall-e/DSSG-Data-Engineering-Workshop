with customer as(
    SELECT * from {{ref('int__order_cust')}}
    ),
payment as(
    SELECT * from {{ref('int__order_payment')}}
)

SELECT 
    customer.customer_id,
    first_name, 
    last_name, 
    customer.order_date, 
    payment_method, 
    payment.amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
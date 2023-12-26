SELECT 
    payment_method, 
    sum(amount) as total_amount
from {{ref('int__order_payment')}}
group by payment_method
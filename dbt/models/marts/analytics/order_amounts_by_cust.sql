SELECT 
    first_name || ' ' || last_name as customer_name, 
    sum(amount) as total_amount
from {{ref('int__cust_payment')}}
group by customer_id, customer_name

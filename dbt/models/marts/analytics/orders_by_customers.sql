SELECT 
    first_name || ' ' || last_name as customer_name, 
    count(status) as order_count
from {{ref('int__order_cust')}}
group by customer_id, customer_name

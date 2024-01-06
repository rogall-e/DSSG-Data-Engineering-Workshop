SELECT
    id as customer_id,
    first_name,
    last_name
from {{source('staging','raw_customers')}}
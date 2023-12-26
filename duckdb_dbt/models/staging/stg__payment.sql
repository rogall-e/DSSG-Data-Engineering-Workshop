SELECT
    id as payment_id,
    order_id,
    payment_method,
    amount
from {{source('staging','raw_payments')}}
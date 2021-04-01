select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    p.Amount/100. as AmountInUsd,
    p.Payment_Status
from 
    {{ source('jaffle_shop', 'stg_orders') }} o
    left join {{ source('stripe', 'stg_stripe_payment') }} p
        on o.order_id = p.order_id
        and payment_status ilike 'success'
    -- and status ilike 'completed'

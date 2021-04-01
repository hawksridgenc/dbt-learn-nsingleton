select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    p.Amount/100. as AmountInUsd,
    p.Payment_Status
from 
    {{ ref('stg_orders') }} o
    left join {{ ref('stg_stripe_payment') }} p
        on o.order_id = p.order_id
        and payment_status ilike 'success'
    -- and status ilike 'completed'

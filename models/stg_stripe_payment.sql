select 
    orderid as Order_Id
    , AMOUNT
    , status as Payment_Status
from
    raw.stripe.payment
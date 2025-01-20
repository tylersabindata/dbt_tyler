with order_info as(
    select
        *
    from 
        {{ ref('stg_order_info') }}
),

sales_location as(
    select
        *
    from 
        {{ ref('stg_sales_location') }}
)

select
    oi.order_id,
    oi.order_date,
    oi.order_status,
    oi.order_quantity,
    sl.currency,
    sl.order_amount * 0.0012 as usd_order_amount,
    oi.fulfilled_by,
    sl.sales_channel
from
    order_info as oi
left join
    sales_location as sl
on oi.order_id = sl.order_id
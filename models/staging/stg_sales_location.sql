select
  `Order ID` as order_id,
  upper(split(`Sales Channel `, '.') [safe_offset(1)])as sales_channel,
  currency,
  Amount as order_amount
from
  {{ source('amazon', 'amazon_sales') }}
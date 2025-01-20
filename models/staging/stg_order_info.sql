select
  `Order ID` as order_id,
  Date as order_date,
  Status as order_status,
  Qty as order_quantity,
  case when `fulfilled-by` is null then 'Unknown' else `fulfilled-by` end as fulfilled_by
from
  {{ source('amazon', 'amazon_sales') }}
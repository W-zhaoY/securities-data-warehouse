insert overwrite table dwd_stock_deal partition(event_date=${hivevar:trade_date})
select
client_id,
found_account,
client_name,
deal_sums,
deal_amount,
deal_date string
from ods_stock_deal
where event_date = ${hivevar:trade_date};

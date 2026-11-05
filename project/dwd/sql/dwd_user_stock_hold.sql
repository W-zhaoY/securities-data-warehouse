insert overwrite table dwd_user_stock_hold partition(event_date=${hivevar:trade_date})
select
client_id,
found_account,
stock_hold_amount
from ods_user_stock_hold
where event_date = ${hivevar:trade_date};

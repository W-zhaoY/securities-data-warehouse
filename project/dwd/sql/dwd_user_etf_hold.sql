insert overwrite table dwd_user_etf_hold partition(event_date=${hivevar:trade_date})
select
client_id,
found_account,
etf_hold_amount
from ods_user_etf_hold
where event_date = ${hivevar:trade_date};

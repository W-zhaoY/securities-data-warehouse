insert overwrite table dim_user_info
select
client_id,
found_account,
client_name,
business_id,
phone_num,
id_card,
client_age,
client_sex,
client_address,
client_open_date
from ods_user_info
where event_date = ${hivevar:trade_date};

insert overwrite table dim_business_info
select
business_id,
business_name,
business_addr,
begin_date
from ods_business_info
where event_date = ${hivevar:trade_date};

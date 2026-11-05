--用户持仓标签
insert overwrite table ads_user_type
select
ui.client_name,
uhl.found_account,
bi.business_name,
uhl.stock_hold_amount,
uhl.etf_hold_amount,
uhl.client_label
from
dws_user_hold_label uhl
left join dim_user_info ui
on uhl.client_id = ui.client_id
left join dim_business_info bi
on ui.business_id = bi.business_id;

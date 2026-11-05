--营业部交易总量表
insert overwrite table ads_business_tran_total
select
btsm.business_id,
bi.business_name,
btsm.deal_sums
from
dws_business_tran_stat_month btsm
left join dim_business_info bi
on btsm.business_id = bi.business_id;

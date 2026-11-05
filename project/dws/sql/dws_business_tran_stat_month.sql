--营业部月度交易信息统计表
--统计营业部每个月的交易量，交易金额，交易次数
insert overwrite table dws_business_tran_stat_month
select
ui.business_id,
sum(sd.deal_sums) as deal_sums,
sum(sd.deal_amount) as deal_amount,
count(1) as deal_count
from dwd_stock_deal sd
left join dim_user_info ui
on sd.found_account = ui.found_account
where sd.event_date >=${hivevar:first_day} and sd.event_date <= ${hivevar:trade_date}
group by ui.business_id;

--业务客户月度交易信息统计表
--统计业务客户每个月的交易量，交易金额，交易次数
insert overwrite table dws_client_tran_stat_month
select
sd.client_id,
sd.found_account,
sum(sd.deal_sums) as deal_sums,
sum(sd.deal_amount) as deal_amount,
count(1) as deal_count
from dwd_stock_deal sd
where sd.event_date >=${hivevar:first_day} and sd.event_date <= ${hivevar:trade_date}
group by sd.client_id,
sd.found_account;

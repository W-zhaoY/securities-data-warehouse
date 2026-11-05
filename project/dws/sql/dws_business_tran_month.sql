--按营业部，分别计算股票基金交易次数，交易金额，交易量
--让交易金额去模2=0 为股票交易 交易金额去模2 !=0为基金交易
insert overwrite table dws_business_tran_month
--股票交易量
select 
ui.business_id,
1 as top_type,--交易指标:交易量
1 as fin_type,--金融类别:股票
sum(deal_sums) as item
from dwd_stock_deal ds
left join dim_user_info ui
on ds.found_account = ui.found_account
where event_date >= ${hivevar:first_day} and event_date<= ${hivevar:trade_date} and deal_amount % 2 = 0
group by ui.business_id
union all
--股票交易金额
select 
ui.business_id,
2 as top_type,--交易指标:交易金额
1 as fin_type,--金融类别:股票
sum(deal_amount) as item
from dwd_stock_deal ds
left join dim_user_info ui
on ds.found_account = ui.found_account
where event_date >= ${hivevar:first_day} and event_date<= ${hivevar:trade_date} and deal_amount % 2 = 0
group by ui.business_id
union all
--股票交易次数
select 
ui.business_id,
3 as top_type,--交易指标:交易金额
1 as fin_type,--金融类别:股票
count(1) as item
from dwd_stock_deal ds
left join dim_user_info ui
on ds.found_account = ui.found_account
where event_date >= ${hivevar:first_day} and event_date<= ${hivevar:trade_date} and deal_amount % 2 = 0
group by ui.business_id
union all
--基金交易量
select 
ui.business_id,
1 as top_type,--交易指标:交易量
2 as fin_type,--金融类别:股票
sum(deal_sums) as item
from dwd_stock_deal ds
left join dim_user_info ui
on ds.found_account = ui.found_account
where event_date >= ${hivevar:first_day} and event_date<= ${hivevar:trade_date} and deal_amount % 2 != 0
group by ui.business_id
union all
--基金交易金额
select 
ui.business_id,
2 as top_type,--交易指标:交易金额
2 as fin_type,--金融类别:股票
sum(deal_amount) as item
from dwd_stock_deal ds
left join dim_user_info ui
on ds.found_account = ui.found_account
where event_date >= ${hivevar:first_day} and event_date<= ${hivevar:trade_date} and deal_amount % 2 != 0
group by ui.business_id
union all
--基金交易次数
select 
ui.business_id,
3 as top_type,--交易指标:交易金额
2 as fin_type,--金融类别:股票
count(1) as item
from dwd_stock_deal ds
left join dim_user_info ui
on ds.found_account = ui.found_account
where event_date >= ${hivevar:first_day} and event_date<= ${hivevar:trade_date} and deal_amount % 2 != 0
group by ui.business_id;


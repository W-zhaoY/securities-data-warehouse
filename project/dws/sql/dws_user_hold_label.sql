---将用户股票基金持仓合并
--判断用户股票持仓>=100000 优质客户标签1
--判断用户股票+基金持仓>=15万 良好客户 标签2
--判断用户股票+基金持仓<15万 一般客户 标签3
--判断用户股票持仓为0基金持仓为0 为流失客户 标签4

insert overwrite table dws_user_hold_label
select
e.client_id,
e.found_account,
s.stock_hold_amount,
e.etf_hold_amount,
case when s.stock_hold_amount >= 100000 then 1
when s.stock_hold_amount + e.etf_hold_amount >= 150000 then 2
when s.stock_hold_amount + e.etf_hold_amount < 150000 and s.stock_hold_amount != 0 or e.etf_hold_amount != 0 then 3
when s.stock_hold_amount = 0 and e.etf_hold_amount = 0 then 4
else '' end as client_label
from
dwd_user_stock_hold s
join
dwd_user_etf_hold e
on s.found_account = e.found_account
and s.event_date='20260311'
and e.event_date='20260311';

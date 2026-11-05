--营业部月度top5
--股票-交易量，股票-交易金额，股票-交易次数。基金-交易量，基金-交易金额，基金交易次数
--股票交易量的前五
insert overwrite table ads_user_type_count

select
count(1) as client_count,
client_label,
case when client_label = 1 then '优质客户'
when client_label = 2 then '良好客户'
when client_label = 3 then '一般客户'
when client_label = 4 then '流失客户'
else '' end as lable_name
from
dws_user_hold_label
group by client_label

--营业部月度top5
--股票-交易量，股票-交易金额，股票-交易次数。基金-交易量，基金-交易金额，基金交易次数
--股票交易量的前五
insert overwrite table ads_business_id_top5_month
select * from
(select
bi.business_id,
bi.business_name,
btm.top_type,
'交易量' as top_type_name,
btm.fin_type,
'股票' as fin_type_name,
btm.item
from
dws_business_tran_month btm
left join dim_business_info bi
on btm.business_id = bi.business_id
where btm.top_type = 1 and fin_type = 1
order by btm.item desc
limit 5) t1
union all
--股票交易金额的前五
select * from
(select
bi.business_id,
bi.business_name,
btm.top_type,
'交易金额' as top_type_name,
btm.fin_type,
'股票' as fin_type_name,
btm.item
from
dws_business_tran_month btm
left join dim_business_info bi
on btm.business_id = bi.business_id
where btm.top_type = 2 and fin_type = 1
order by btm.item desc
limit 5) t2
union all
--股票交易次数的前五
select * from
(select
bi.business_id,
bi.business_name,
btm.top_type,
'交易次数' as top_type_name,
btm.fin_type,
'股票' as fin_type_name,
btm.item
from
dws_business_tran_month btm
left join dim_business_info bi
on btm.business_id = bi.business_id
where btm.top_type = 3 and fin_type = 1
order by btm.item desc
limit 5) t3
--基金交易量前五
union all
select * from
(select
bi.business_id,
bi.business_name,
btm.top_type,
'交易量' as top_type_name,
btm.fin_type,
'基金' as fin_type_name,
btm.item
from
dws_business_tran_month btm
left join dim_business_info bi
on btm.business_id = bi.business_id
where btm.top_type = 1 and fin_type = 2
order by btm.item desc
limit 5) t4
union all
--基金交易金额的前五
select * from
(select
bi.business_id,
bi.business_name,
btm.top_type,
'交易金额' as top_type_name,
btm.fin_type,
'基金' as fin_type_name,
btm.item
from
dws_business_tran_month btm
left join dim_business_info bi
on btm.business_id = bi.business_id
where btm.top_type = 2 and fin_type = 2
order by btm.item desc
limit 5) t5
--基金交易次数的前五
union all
select * from
(select
bi.business_id,
bi.business_name,
btm.top_type,
'交易次数' as top_type_name,
btm.fin_type,
'基金' as fin_type_name,
btm.item
from
dws_business_tran_month btm
left join dim_business_info bi
on btm.business_id = bi.business_id
where btm.top_type = 3 and fin_type = 2
order by btm.item desc
limit 5) t6;



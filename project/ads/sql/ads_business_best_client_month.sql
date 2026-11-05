--营业部月度指标最佳业务客户
insert overwrite table ads_business_best_client_month
--拿到结果集
select  
bi.business_name,
tt1.client_name1,
tt1.deal_sums,
tt2.client_name2,
tt2.deal_amount,
tt3.client_name3,
tt3.deal_count
from
(select t1.business_id,t1.client_name as client_name1,t1.deal_sums
--求按营业部分组开窗求最大的交易量对应业务客户
from
(select
ui.business_id,
ui.client_id,
ui.client_name,
ctsm.deal_sums,
row_number() over(partition by ui.business_id order by ctsm.deal_sums desc) as num--按照营业部开窗，交易量倒序排序
from
dws_client_tran_stat_month ctsm
left join
dim_user_info ui
on ui.client_id = ctsm.client_id) t1
where t1.num = 1--取出倒叙第一既最大的交易量对应的值
) tt1
join 
(select t2.business_id,t2.client_name as client_name2,t2.deal_amount
--求按营业部分组开窗求最大的交易金额对应业务客户
from
(select
ui.business_id,
ui.client_id,
ui.client_name,
ctsm.deal_amount,
row_number() over(partition by ui.business_id order by ctsm.deal_amount desc) as num--按照营业部开窗，交易金额倒序排序
from
dws_client_tran_stat_month ctsm
left join
dim_user_info ui
on ui.client_id = ctsm.client_id) t2
where t2.num = 1--取出倒叙第一既最大的交易金额对应的值
) tt2
on tt1.business_id = tt2.business_id
join
(select t3.business_id,t3.client_name as client_name3,t3.deal_count
--求按营业部分组开窗求最大的交易次数对应业务客户
from
(select
ui.business_id,
ui.client_id,
ui.client_name,
ctsm.deal_count,
row_number() over(partition by ui.business_id order by ctsm.deal_count desc) as num--按照营业部开窗，交易次数倒序排序
from
dws_client_tran_stat_month ctsm
left join
dim_user_info ui
on ui.client_id = ctsm.client_id) t3
where t3.num = 1--取出倒叙第一既最大的交易次数对应的值
) tt3
on tt1.business_id = tt3.business_id
join dim_business_info bi
on tt1.business_id = bi.business_id;




--营业部月度TOP5
drop table ads_business_id_top5_month;
create table ads_business_id_top5_month(
business_id int,--营业部id
business_name string,--营业部名称
top_type int ,--指标类型
top_type_name string,--指标名称
fin_type int ,--金融类别
fin_type_name string,--金融名称
item decimal(15,2) --值
)stored as parquet;



--营业部交易总量表
drop table ads_business_tran_total;
create table ads_business_tran_total(
business_id int,--营业部id
business_name string,--营业部名称
tran_total decimal(15,2)--总交易量
)stored as parquet;


--用户持仓标签
drop table ads_user_type;
create table ads_user_type(
client_name string,--客户姓名
found_account int,--资金账号
business_name string,--营业部名称
stock_hold decimal(15,2),--股票持仓
etf_hold decimal(15,2),--etf持仓
client_label int --客户标签
)stored as parquet;



--客户标签数量
drop table ads_user_type_count;
create table ads_user_type_count(
client_count int,--客户数量
client_label int,--客户标签
lable_name string--标签名称
)stored as parquet;

--营业部月度指标最佳业务客户
drop table ads_business_best_client_month;
create table ads_business_best_client_month(
business_name string,--业务部名称
client_name1 string,--客户姓名1
deal_sums int,--交易量
client_name2 string,--客户姓名2
deal_amount decimal(15,2),--交易金额
client_name3 string,--客户姓名3
deal_count int--交易次数
)stored as parquet;






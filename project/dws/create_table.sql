
--用户持仓标签
drop table dws_user_hold_label;
create table dws_user_hold_label(
client_id int,--客户id
found_account int,--资金账号
stock_hold_amount decimal(15,2),--证券持仓市值
etf_hold_amount decimal(15,2),--基金持仓市值
client_label int--客户持仓标签
)stored as parquet;


--营业部月度交易信息
drop table dws_business_tran_month;
create table dws_business_tran_month(
business_id int,--营业部id
top_type int,--指标类型
fin_type int,--金融类别
item decimal(15,2)--值
)stored as parquet;

--营业部月度交易信息统计表
drop table dws_business_tran_stat_month;
create table dws_business_tran_stat_month(
business_id int,--营业部id
deal_sums int,--交易量
deal_amount decimal(15,2),--交易金额
deal_count int--交易次数
)stored as parquet;


--业务客户月度交易信息统计表
drop table dws_client_tran_stat_month;
create table dws_client_tran_stat_month(
client_id int,--业务客户id
found_account int,--资金账号
deal_sums int,--交易量
deal_amount decimal(15,2),--交易金额
deal_count int--交易次数
)stored as parquet;





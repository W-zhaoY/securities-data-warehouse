--用户信息维度表
create table dim_user_info(
client_id int,--用户id
found_account int,--资金账号
client_name string,--用户姓名
business_id int,--开户营业部id
phone_num bigint,--手机号
id_card string,--身份证号
client_age int,--客户年龄
client_sex string,--客户性别
client_address string,--客户地址
client_open_date string--开户日期
)stored as parquet;


--用户证券持仓市值
create table dwd_user_stock_hold(
client_id int,--用户id
found_account int,--资金账号
stock_hold_amount decimal(15,2)--证券持仓市值
)partitioned by (event_date string)
stored as parquet;

--用户基金持仓市值
create table dwd_user_etf_hold(
client_id int,--用户id
found_account int,--资金账号
etf_hold_amount decimal(15,2)--证券持仓市值
)partitioned by (event_date string)
stored as parquet;

--营业部信息维度表
create table dim_business_info(
business_id int,--营业部id
business_name string,--营业部名称
business_addr string,--营业部地址
begin_date string--营业部成立日期
)stored as parquet;

--证券交易流水
create table dwd_stock_deal(
client_id int,--用户id
found_account int,--资金账号
client_name string,--用户姓名
deal_sums int,--交易量
deal_amount decimal(15,2),
deal_date string--交易日期
)partitioned by (event_date string)
stored as parquet;





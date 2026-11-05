--钀ヤ笟閮ㄦ湀搴OP5
drop table ads_business_id_top5_month;
create table ads_business_id_top5_month(
business_id int comment '钀ヤ笟閮╥d',
business_name varchar(255) comment '钀ヤ笟閮ㄥ悕绉?,
top_type int comment '鎸囨爣绫诲瀷',
top_type_name varchar(255) comment '鎸囨爣鍚嶇О',
fin_type int comment '閲戣瀺绫诲埆',
fin_type_name varchar(255) comment '閲戣瀺鍚嶇О',
item decimal(15,2) comment '鍊?
)ENGINE=InnoDB DEFAULT CHARSET=utf8;




--钀ヤ笟閮ㄤ氦鏄撴€婚噺琛?drop table ads_business_tran_total;
create table ads_business_tran_total(
business_id int comment '钀ヤ笟閮╥d',
business_name varchar(255) comment '钀ヤ笟閮ㄥ悕绉?,
tran_total decimal(15,2) comment '鎬讳氦鏄撻噺'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



--鐢ㄦ埛鎸佷粨鏍囩
drop table ads_user_type;
create table ads_user_type(
client_name varchar(255) comment '瀹㈡埛濮撳悕',
found_account int comment '璧勯噾璐﹀彿',
business_name varchar(255) comment '钀ヤ笟閮ㄥ悕绉?,
stock_hold decimal(15,2) comment '鑲＄エ鎸佷粨',
etf_hold decimal(15,2) comment 'etf鎸佷粨',
client_label int  comment '瀹㈡埛鏍囩'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;








--瀹㈡埛鏍囩鏁伴噺
drop table ads_user_type_count;
create table ads_user_type_count(
client_count int comment '瀹㈡埛鏁伴噺',
client_label int  comment '瀹㈡埛鏍囩',
lable_name varchar(255) comment '鏍囩鍚嶇О'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


--钀ヤ笟閮ㄦ湀搴︽寚鏍囨渶浣充笟鍔″鎴?drop table ads_business_best_client_month;
create table ads_business_best_client_month(
business_name varchar(255) comment '涓氬姟閮ㄥ悕绉?,
client_name1 varchar(255) comment '瀹㈡埛濮撳悕1',
deal_sums int comment '浜ゆ槗閲?,
client_name2 varchar(255) comment '瀹㈡埛濮撳悕2',
deal_amount decimal(15,2) comment '浜ゆ槗閲戦',
client_name3 varchar(255) comment '瀹㈡埛濮撳悕3',
deal_count int comment '浜ゆ槗娆℃暟'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





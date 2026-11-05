insert overwrite table ods_business_info partition(event_date=${hivevar:trade_date})
select * from
(select 100,"西安营业部","西安路36号","20200130"
union all
select 101,"安康营业部","安康路52号","20210305"
union all
select 102,"咸阳营业部","咸阳街51号","20200923"
union all
select 103,"延安营业部","枣园路32号","20220403"
union all
select 104,"铜川营业部","铜川街45号","20220506"
union all
select 105,"临潼营业部","临潼路45号","20220405"
union all
select 106,"渭南营业部","渭南街89号","20230507"
union all
select 107,"商洛营业部","商洛街72号","20230513"
union all
select 108,"汉中营业部","汉中路51号","20240106"
union all
select 109,"宝鸡营业部","宝鸡路43号","20240721") t;
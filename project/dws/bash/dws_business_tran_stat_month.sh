#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile

/opt/spark/bin/spark-sql \
--conf 'spark.sql.shuffle.partitions=1' \
--database $db \
-hivevar first_day=$first_day \
-hivevar trade_date=$trade_date \
-f ${dir}/../sql/dws_business_tran_stat_month.sql


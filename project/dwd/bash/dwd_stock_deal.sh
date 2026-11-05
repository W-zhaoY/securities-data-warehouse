#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile
his_date="20260311"
/opt/spark/bin/spark-sql \
--conf 'spark.sql.shuffle.partitions=1' \
--database $db \
-hivevar trade_date=$his_date \
-f ${dir}/../sql/dwd_stock_deal.sql


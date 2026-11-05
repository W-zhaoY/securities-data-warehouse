#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile

/opt/spark/bin/spark-sql \
--conf 'spark.sql.shuffle.partitions=1' \
--database $db \
-hivevar trade_date=$trade_date \
-f ${dir}/../sql/dim_business_info.sql


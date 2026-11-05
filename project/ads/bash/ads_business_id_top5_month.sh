#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile

/opt/spark/bin/spark-sql \
--conf 'spark.sql.shuffle.partitions=1' \
--database $db -f ${dir}/../sql/ads_business_id_top5_month.sql

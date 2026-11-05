#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile


/opt/spark/bin/spark-submit \
--jars /opt/spark/jars/mysql-connector-java-5.1.7-bin.jar \
${dir}/../py/ads_business_tran_total.py


#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile

hive --database $db -hivevar trade_date=$trade_date -f ${dir}/../sql/ods_business_info.sql


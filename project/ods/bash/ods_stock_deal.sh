#!/bin/bash
dir=$(cd "$(dirname "$0")"; pwd)
source ../../bash_profile
#his_date="20250708"
hive --database $db -hivevar trade_date=$his_date -f ${dir}/../sql/ods_stock_deal${1}.sql


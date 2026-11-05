#!/bin/bash

source ../bash_profile

hive --database $db  -f create_table.sql


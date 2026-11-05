import os
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Hive to MySQL Export") \
    .config("spark.sql.hive.convertMetastoreParquet", "true") \
    .enableHiveSupport() \
    .getOrCreate()

df = spark.sql("SELECT * FROM gcproject.ads_business_best_client_month")

df.write.format("jdbc") \
    .option("url", f"jdbc:mysql://{os.environ.get('MYSQL_HOST', 'hadoop1')}:3306/gcproject?useUnicode=true&characterEncoding=UTF-8") \
    .option("dbtable", "ads_business_best_client_month") \
    .option("user", os.environ.get("MYSQL_USER", "root")) \
    .option("password", os.environ.get("MYSQL_PASSWORD", "")) \
    .mode("overwrite") \
    .save()


# Databricks notebook source
dbutils.widgets.text("file_name","")

file_name=dbutils.widgets.get("file_name")

# COMMAND ----------

df=spark.read.format("parquet")\
    .load(f"/Volumes/db_jobs/default/raw_vol/{file_name}.parquet");

# COMMAND ----------

df.write.format("delta")\
    .mode("overwrite")\
    .save(f"/Volumes/db_jobs/default/raw_vol/sinkSQL/{file_name}");
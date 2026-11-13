# Databricks notebook source
df=spark.createDataFrame([("James",40),("Ann",30),("Tom",40),("Alice",40)],["name","age"])
display(df)

# COMMAND ----------

display(df.count())

# COMMAND ----------

total_records=df.count()
total_records

# COMMAND ----------

dbutils.jobs.taskValues.set(key="total_records", value=total_records)

# COMMAND ----------


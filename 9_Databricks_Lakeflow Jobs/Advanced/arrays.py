# Databricks notebook source
file_names=[
    {"file_name":"orders"},
    {"file_name":"products"},
    {"file_name":"regions (1)"}
]

# COMMAND ----------

dbutils.jobs.taskValues.set(key="file_names",value=file_names)

# COMMAND ----------


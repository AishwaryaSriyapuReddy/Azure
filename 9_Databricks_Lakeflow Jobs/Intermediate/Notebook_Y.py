# Databricks notebook source
dbutils.widgets.text("records_processed","")

# COMMAND ----------

record_processed=dbutils.widgets.get("records_processed")
record_processed

# COMMAND ----------


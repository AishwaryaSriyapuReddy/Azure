# Databricks notebook source
dbutils.widgets.text("sql_output","")

# COMMAND ----------

value=dbutils.widgets.get("sql_output");

# COMMAND ----------

print(value)
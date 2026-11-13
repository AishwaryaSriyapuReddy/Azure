# Databricks notebook source
df=spark.read.table("dlt_catalog4.source.orders")
display(df)

# COMMAND ----------


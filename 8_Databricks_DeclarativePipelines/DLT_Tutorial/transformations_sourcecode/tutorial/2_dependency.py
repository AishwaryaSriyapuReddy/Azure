# import dlt
# from pyspark.sql.functions import *

# '''Creating End-to-End Basic Pipeline'''

# # Staging Area

# @dlt.table(
#     name="staging_orders"
# )
# def staging_orders():
#     df=spark.readStream.table("dlt_catalog4.source.orders")
#     return df

# # Create Transform Area
# @dlt.view(
#     name="transformed_orders"
# )
# def transformed_orders():
#     df=spark.readStream.table("staging_orders")
#     df=df.withColumn("order_date",df.order_date.cast("date"))
#     df=df.withColumn("order_status",lower(col("order_status")))
#     return df

# # Creating Aggregated Area (Gold layer)
# @dlt.table(
#     name="aggregated_orders"
# )
# def aggregated_orders():
#     df=spark.readStream.table("transformed_orders")
#     df=df.groupBy("order_status").count()
#     return df

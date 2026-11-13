# import dlt

# # Creating Streaming Table

# @dlt.table(
#     name="first_stream_table"
# )
# def first_stream_table():
#     df=spark.readStream.table("dlt_catalog4.source.orders")
#     return df


# # Creating Materialized View
# @dlt.table(
#     name="firt_mat_view"
# )
# def  first_mat_view():
#     df=spark.read.table("dlt_catalog4.source.orders")
#     return df


# # Create Batch View
# @dlt.view(
#     name="first_batch_view"
# )
# def first_batch_view():
#     df=spark.read.table("dlt_catalog4.source.orders")
#     return df

# # Creating Streaming View
# @dlt.view(
#     name="first_stream_view"
# )
# def first_stream_view():
#     df=spark.readStream.table("dlt_catalog4.source.orders")
#     return df


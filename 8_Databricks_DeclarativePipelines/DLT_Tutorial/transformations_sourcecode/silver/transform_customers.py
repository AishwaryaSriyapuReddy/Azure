import dlt
from pyspark.sql.functions import *

# Transformaing customers data  -- Creating Bronze view for Silver Layer
@dlt.view(
    name="customers_enr_view"
)
def customers_enr_view():
    df=spark.readStream.table("customers_stg")
    df=df.withColumn("customer_name",upper(col("customer_name")))
    return df
    
# Creating the destination silver table (target table)
dlt.create_streaming_table(
    name="customers_enr")


dlt.create_auto_cdc_flow(
    target = "customers_enr",
    source = "customers_enr_view",
    keys = ["customer_id"],
    sequence_by = "last_updated",
    system_sequence_by = None, # optional
    ignore_null_updates = False, # optional
    ignore_null_updates_column_list = None, # optional
    ignore_null_updates_except_column_list = None, # optional
    columns_to_update = None, # optional
    apply_as_deletes = None, # optional
    apply_as_truncates = None, # optional
    column_list = None, # optional
    except_column_list = None, # optional
    stored_as_scd_type = "1", # optional
    track_history_column_list = None, # optional
    track_history_except_column_list = None, # optional
    name = None, # optional
    once = False # optional
)


# Creating Silver View for Gold Layer

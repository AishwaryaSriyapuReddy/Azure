import dlt

# Customer Expectations
customer_rules={
    "rule_1":"customer_id is NOT NULL",
    "rule_2":"region is NOT NULL"
}
# Ingesting Customer data

@dlt.table(
    name="customers_stg"
)
@dlt.expect_all_or_drop(customer_rules)
def customers_stg():
    df=spark.readStream.table("dlt_catalog4.source.customers")
    return df
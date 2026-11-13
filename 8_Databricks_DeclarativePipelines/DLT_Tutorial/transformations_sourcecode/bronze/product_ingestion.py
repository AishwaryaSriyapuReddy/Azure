import dlt

# Product Expectations
product_rules={
    "rule_1":"product_id is NOT NULL",
    "rule_2":"price >=0"
}
# Ingesting Products

@dlt.table(
    name="products_stg"
)
@dlt.expect_all_or_drop(product_rules)
def products_stg():
    df=spark.readStream.table("dlt_catalog4.source.products")
    return df
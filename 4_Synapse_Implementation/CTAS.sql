-- External Table
Create external table parquet_table(
Dealer_id varchar(4000),
Match_id varchar(4000),
Branch_id varchar(4000),
Dateid varchar(4000),
Units_sold BIGINT,
Revenue BIGINT
)
With (
LOCATION='/cetas_revenue',
DATA_SOURCE=raw_ext_source,
FILE_FORMAT=parquetfile
)


-- Creating Parquet file format
drop external file format parquetfile;
CREATE EXTERNAL FILE FORMAT parquetfile
WITH (
         FORMAT_TYPE = PARQUET,
	       DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);


-- CTAS
CREATE TABLE poly_table
With
(
DISTRIBUTION=round_robin
)
AS
Select * from parquet_table

select * from poly_table;
-- CREATE EXTERNAL TABLES
drop external table revenue_ext_table;
Create external table revenue_ext_table
(
Dealer_id varchar(4000),
Match_id varchar(4000),
Branch_id varchar(4000),
Date_id varchar(4000),
Units_sold varchar(4000),
Revenue varchar(4000)
)
with(
LOCATION='revenue',
DATA_SOURCE=raw_ext_source,
File_FORMAT=csv_format
);

select Top 3 * from revenue_ext_table;

-- Creating Parquet file format

CREATE EXTERNAL FILE FORMAT parquetfile
WITH (
         FORMAT_TYPE = PARQUET,
	       DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);


-- Creating  Table using CETAS
CREATE EXTERNAL TABLE revenue_cetas
with(
	LOCATION='cetas_revenue',
	DATA_SOURCE= raw_ext_source,
	FILE_FORMAT=parquetfile    --(to bestored data in this file format) (before using this parquet, create parquet file format first)
) as
Select * 
from 
OPENROWSET(
Bulk 'revenue', 
DATA_SOURCE='raw_ext_source',     -- this url and inside folders to access,  enter in BULK
FORMAT='CSV',
PARSER_VERSION='2.0', 
HEADER_ROW=TRUE    
) as query1;

-- Views

CREATE VIEW revenue_view
As
Select * 
from 
OPENROWSET(
Bulk 'revenue', 
DATA_SOURCE='raw_ext_source',     -- this url and inside folders to access,  enter in BULK
FORMAT='CSV',
PARSER_VERSION='2.0', 
HEADER_ROW=TRUE    
) as query1;

Select * from revenue_view;
-- Secanrio

Create external table revenue_2    --> table runs even though the revenue2 is not present
(
Dealer_id varchar(4000),
Match_id varchar(4000),
Branch_id varchar(4000),
Dateid varchar(4000),
Units_sold varchar(4000),
Revenue varchar(4000)
)
with(
LOCATION='revenue2',
DATA_SOURCE=raw_ext_source,
File_FORMAT=csv_format
)

select * from revenue_2;

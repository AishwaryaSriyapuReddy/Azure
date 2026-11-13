CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Secure#2026!LongerKey@Pcs';

-- Create Credential
Create database scoped credential aishcreds
With
identity='Managed Identity';


-- Create External Location (or) Data Source
drop external data source raw_ext_source
Create external data source raw_ext_source
with(
	location='abfss://raw@p4datalake.dfs.core.windows.net/',
	credential=aishcreds
)
-- 1. Create the table cleanly
DROP TABLE copy_into_table;
CREATE TABLE copy_into_table(
    Dealer_id varchar(4000),
    Match_id varchar(4000),
    Branch_id varchar(4000),
    Dateid varchar(4000),
    Units_sold BIGINT,
    Revenue BIGINT
)
WITH (
    DISTRIBUTION=ROUND_ROBIN
);

-- 2. Load the data using the proper Parquet syntax
COPY INTO copy_into_table
(       Dealer_id 'Dealer_ID',
        Match_id  'Model_ID',   -- Maps your table's Match_id to the file's Model_ID
        Branch_id 'Branch_ID',
        Dateid    'Date_ID',     -- Maps your table's Dateid to the file's Date_ID
        Units_sold 'Units_Sold',
        Revenue  'Revenue'
    )
FROM 'https://p4datalake.blob.core.windows.net/raw/cetas_revenue/'
WITH(
    FILE_TYPE='PARQUET',
    CREDENTIAL=(IDENTITY='Managed Identity'), -- Tells Synapse to use the Managed Identity identity you set up
);

-- 3. Check your loaded rows
SELECT * FROM copy_into_table;
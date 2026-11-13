-- Create Master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Secure#2026!LongerKey@Pcs';

-- Create Credential
Create database scoped credential aishcreds
With
identity='Managed Identity';


-- Create External Location (or) Data Source
Create external data source raw_ext_source
with(
	location='https://p4datalake.dfs.core.windows.net/raw',
	credential=aishcreds
)
--- Create External File Format
drop external file format csv_format;
Create external file format  csv_format
with(
FORMAT_TYPE=DELIMITEDTEXT,
FORMAT_OPTIONS(
FIELD_TERMINATOR =',')
)


--- Reading data from datalake and also quering directly on a file using OPENROWSET
Select * 
from 
OPENROWSET(
Bulk 'revenue', 
DATA_SOURCE='raw_ext_source',     -- this url and inside folders to access,  enter in BULK
FORMAT='CSV',
PARSER_VERSION='2.0', 
HEADER_ROW=TRUE    
) as query1



--- ROUND ROBIN TABLE
Create table round_table (
Id INT,
Name VARCHAR(4000),
Salary int
)
with(
Distribution=ROUND_ROBIN
);

INSERT INTO round_table
Values (1,'aa',10000);

Select * from round_table;

--- REPLICATE
Create schema gold;
Create table gold.dim_product(
Dim_key_prod int,
Prod_id int,
Prod_name varchar(4000)
)
with(
distribution=REPLICATE
);


—-- HASH TABLE
Create table gold.facttable(
Dim_key_prod int,
Revenue int,
Cost int
)with(
distribution=HASH(dim_key_prod
));


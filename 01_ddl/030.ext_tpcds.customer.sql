CREATE EXTERNAL TABLE ext_tpcds.customer (like tpcds.customer)
LOCATION (:LOCATION)
FORMAT 'TEXT' (DELIMITER '|' NULL AS '' ESCAPE AS E'\\');

CREATE KEYSPACE IF NOT EXISTS store WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

CREATE TABLE IF NOT EXISTS store.product (
product_id int PRIMARY KEY,
name text,
description text,
price double,
active boolean,
item_count int,
last_update_timestamp timestamp
);
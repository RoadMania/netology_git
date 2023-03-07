<a name="db1"></a> 06-db-04-postgresql<br>
<b>Задание 1. </b><br>
```
\l - список БД
\c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo} connect to new database (currently "postgres")
\dt[S+] [PATTERN] 
\d[S+]  NAME
\q
```
<b>Задание 2. </b> <br> 
```
psql -f /backup/dump.sql test_database
SET
SET
SET
SET
SET
 set_config 
------------
 
(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
COPY 8
 setval 
--------
      8
(1 row)

ALTER TABLE
```
Использование таблицы pg_stats:
```
postgres=# select avg_width from pg_stats where tablename='orders';
```
<b>Задание 3. </b> <br>
Нужно было определить тип "partitioned table" на моменте создания, тогда ручное разбиение можно было бы избежать. 
```
postgres=# 
begin;
    create table orders_new (
        id integer NOT NULL,
        title varchar(80) NOT NULL,
        price integer) partition by range(price);
    create table orders_less partition of orders_new for values from (0) to (499);
    create table orders_more partition of orders_new for values from (499) to (99999);
    insert into orders_new (id, title, price) select * from orders;
commit;
BEGIN
CREATE TABLE
CREATE TABLE
CREATE TABLE
INSERT 0 8
COMMIT
```
<br><b>Задание 4. </b> <br>
Чтобы добавить уникальность, можно использовать UNIQUE 
```
pg_dump -d test_database > /backup/db_dump.sql
```

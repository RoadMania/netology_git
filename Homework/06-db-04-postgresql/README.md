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
```
INSERT INTO orders (name,price) VALUES
('Шоколад',10),
('Принтер',3000),
('Книга',500),
('Монитор',7000),
('Гитара',4000);
INSERT 0 5
```
```
INSERT INTO clients (fullname,country) VALUES
('Иванов Иван Иванович','USA'),
('Петров Петр Петрович','Canada'),
('Иоганн Себастьян Бах','Japan'),
('Ронни Джеймс Дио','Russia'),
('Ritchie Blackmore','Russia');
INSERT 0 5
```
<br><b>Задание 4. </b> <br>
Для выполнения этой задачи я создал дополнительный столбец <b> order_id </b>
```
UPDATE clients
SET order_id = (SELECT id FROM orders WHERE name = 'Книга')
WHERE fullname = 'Иванов Иван Иванович';

UPDATE clients
SET order_id = (SELECT id FROM orders WHERE name = 'Монитор')
WHERE fullname = 'Петров Петр Петрович';

UPDATE clients
SET order_id = (SELECT id FROM orders WHERE name = 'Гитара')
WHERE fullname = 'Иоганн Себастьян Бах';
```
```
select * from clients;
 id |       fullname       | country |  order_id
----+----------------------+---------+----------
  9 | Ронни Джеймс Дио     | Russia  |
 10 | Ritchie Blackmore    | Russia  |
  6 | Иванов Иван Иванович | USA     |        3
  7 | Петров Петр Петрович | Canada  |        4
  8 | Иоганн Себастьян Бах | Japan   |        5
```
<br><b>Задание 5. </b> <br>
```
EXPLAIN select * from clients;
--------------------------------------------------------
 Seq Scan on clients  (cost=0.00..1.05 rows=5 width=47)
(1 row)
```
Seq Scan — используется последовательное чтение данных. </br>
Cost - оценивается время и использование ресурсов.</br>
rows — приблизительное количество возвращаемых строк</br>
width - сколько в среднем байт содержится в одной строке.</br>
<br><b>Задание 6. </b> <br>
Роли:
```
docker exec -it postgre1 pg_dumpall -U postgres --roles-only -f /tmp/backup/roles.sql
```
База:
```
docker exec -it postgre1 pg_dump -h localhost -U postgres -F t -f /tmp/backup/backup_1.tar test_db
```
Запуск нового контейнера:
```
docker run --name postgre2 -d -e POSTGRES_HOST_AUTH_METHOD=trust -v 'C:\Users\spenc\docker\06-sql-2:/var/lib/postgresql/data' -v 'C:\Users\spenc\docker\06-sql-backup:/tmp/backup' postgres:12
```
Создаём базу:
```
docker exec -it postgre2 psql -U postgres -c "CREATE DATABASE test_db WITH ENCODING='UTF-8';"
```
Восстанавливаем базу из бэкапа:
```
docker exec -it postgre2 pg_restore -U postgres -Ft -v -d test_db /tmp/backup/backup_1.tar
```

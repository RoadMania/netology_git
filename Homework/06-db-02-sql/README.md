<a name="db1"></a> 06-db-02-sql <br>
<b>Задание 1. </b><br>
```
docker run --name postgre1 -d -e POSTGRES_HOST_AUTH_METHOD=trust -v 'C:\Users\spenc\docker\06-sql:/var/lib/postgresql/data' -v 'C:\Users\spenc\docker\06-sql-backup:/tmp/backup' postgres:12
```
<b>Задание 2. </b> <br>
Итоговый список БД с описанием: 
```
test_db=# \l+

                                                                   List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   |  Size   | Tablespace |   Description
-----------+----------+----------+------------+------------+-----------------------+---------+------------+--------------------------------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |                       | 8113 kB | pg_default | default administrative connection database
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +| 7801 kB | pg_default | unmodifiable empty database
           |          |          |            |            | postgres=CTc/postgres |         |            |
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +| 7801 kB | pg_default | default template for new databases
           |          |          |            |            | postgres=CTc/postgres |         |            |
 test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 |                       | 7801 kB | pg_default |
(4 rows)
```
SQL-запрос для выдачи списка пользователей с правами над таблицами test_db:
```
SELECT table_name,grantee,privilege_type 
FROM information_schema.table_privileges
WHERE table_schema NOT IN ('information_schema','pg_catalog');
```
Список пользователей с правами над таблицами test_db можно получить таким же запросом, как выше. </br> </br>
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

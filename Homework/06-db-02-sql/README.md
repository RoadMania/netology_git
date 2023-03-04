<a name="db1"></a> 06-db-02-sql <br>
<b>Задание 1. </b><br>
```
version: "3.9"

volumes:
  postgressql_data:  
  backup_postgressql_data:

services:
  
  postgressql:
    image: postgres:12-bullseye 
    container_name: postgressql
    environment:
      - PGDATA=/var/lib/postgresql/data/
      - POSTGRES_PASSWORD=123456
    volumes:
      - postgressql_data:/var/lib/postgresql/data
      - backup_postgressql_data:/backup
      - ./config:/docker-entrypoint-initdb.d
    network_mode: "host"
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
<div> Это взаимоисключающие принципы. Например, ACID гарантирует консистентность данных после транзакции, BASE же допускает возврат неверных данных. </div>
<br><b>Задание 4. </b> <br>
<div> Думаю, речь про Redis. Redis - БД с высокой производительностью за счет хранения данных в памяти. Минус здесь в том, что мы можем потерять свои данные, если система не успеет их сохранить   </div>


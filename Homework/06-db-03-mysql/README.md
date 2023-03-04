<a name="db1"></a> 06-db-03-mysql <br>
<b>Задание 1. </b><br>
```
mysql> \s
--------------
mysql  Ver 8.0.22 for Linux on x86_64 (MySQL Community Server - GPL)
```
Количество записей с price > 300
```
mysql> select count(*) from orders where price>300;
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec) 
```
<b>Задание 2. </b><br>
```
mysql> CREATE USER 'test' IDENTIFIED WITH mysql_native_password BY 'testpass'
    -> WITH MAX_QUERIES_PER_HOUR 100 PASSWORD EXPIRE INTERVAL 180 DAY FAILED_LOGIN_ATTEMPTS 3
    -> ATTRIBUTE '{"surname": "Pretty", "name": "James"}';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT SELECT on test_db.* TO test;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from INFORMATION_SCHEMA.USER_ATTRIBUTES;
+------------------+-----------+----------------------------------------+
| USER             | HOST      | ATTRIBUTE                              |
+------------------+-----------+----------------------------------------+
| test             | %         | {"name": "James", "surname": "Pretty"} |
+------------------+-----------+----------------------------------------+
```
<b>Задание 3. </b><br>
```
mysql> show table status\G
*************************** 1. row ***************************
           Name: orders
         Engine: InnoDB
```
```
mysql> SHOW PROFILES;
+----------+------------+----------------------------------+
| Query_ID | Duration   | Query                            |
+----------+------------+----------------------------------+
|       11 | 0.09740925 | ALTER TABLE orders ENGINE=MyISAM |
|       12 | 0.11446900 | ALTER TABLE orders ENGINE=InnoDB |
+----------+------------+----------------------------------+
2 rows in set, 1 warning (0.00 sec)
```
<b>Задание 4. </b><br>
```
innodb_file_per_table=1
innodb_log_buffer_size=1M
innodb_buffer_pool_size=2,4G
innodb_log_file_size=100M
innodb_flush_method = O_DIRECT
tmpdir = /dev/shm
table_cache = 4096
table_definition_cache = 4096
```

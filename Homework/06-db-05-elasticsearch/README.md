<a name="db1"></a>06-db-05-elasticsearch <br> <br>
<b>Задание 1. </b> <br> <br>
Dockerfile манифест <br>
```
FROM centos:7

EXPOSE 9200 9300

USER 0

RUN export ES_HOME="/var/lib/elasticsearch" && \
    yum -y install wget && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.0-linux-x86_64.tar.gz && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.0-linux-x86_64.tar.gz.sha512 && \
    sha512sum -c elasticsearch-7.16.0-linux-x86_64.tar.gz.sha512 && \
    tar -xzf elasticsearch-7.16.0-linux-x86_64.tar.gz && \
    rm -f elasticsearch-7.16.0-linux-x86_64.tar.gz* && \
    mv elasticsearch-7.16.0 ${ES_HOME} && \
    useradd -m -u 1000 elasticsearch && \
    chown elasticsearch:elasticsearch -R ${ES_HOME} && \
    yum -y remove wget && \
    yum clean all
COPY --chown=elasticsearch:elasticsearch config/* /var/lib/elasticsearch/config/

USER 1000

ENV ES_HOME="/var/lib/elasticsearch" \
    ES_PATH_CONF="/var/lib/elasticsearch/config"
WORKDIR ${ES_HOME}

CMD ["sh", "-c", "${ES_HOME}/bin/elasticsearch"]
```
Ссылка на DockerHub: https://hub.docker.com/r/spencer98/elasticsearch <br> <br> 
ответ Elasticsearch на запрос пути / в json-виде:
```
{
  "name" : "netology_test",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "tKIGNLKCT1SfPjIJETI-A",
  "version" : {
    "number" : "7.16.0",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "8fy58562312141fj76915oc1ccd76q58ac17bb0t",
    "build_date" : "2023-06-01T13:32:11.478812798R",
    "build_snapshot" : false,
    "lucene_version" : "8.10.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```
<br>
<b>Задание 2. </b> <br> <br>
Cписок индексов и их статусов: <br>

```
  health status index            uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   .geoip_databases qwghBG1SjUIFv-rt-VJOPf   1   0         42            0     41.1mb         41.1mb
green  open   ind-1            FEsd53efsvDffjd-sdkccl   1   0          0            0       226b           226b
yellow open   ind-3            5cvjIOdjdd-oifdd-fKdjv   4   2          0            0       226b           226b
yellow open   ind-2            7osdjDFD_qwExc-dKdcsdd   2   1          0            0       226b           226b
```
Cостояние кластера elasticsearch: <br>

```
  {
  "cluster_name" : "elasticsearch",
  "status" : "yellow",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 10,
  "active_shards" : 10,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 10,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 50.0
}
```
Как вы думаете, почему часть индексов и кластер находятся в состоянии yellow? <br>
Жёлтый цвет означает, что основной сегмент выделен, а реплики — нет. <br> <br>

<b>Задание 3. </b> <br> <br>
Запрос API и результат вызова API для создания репозитория: <br>

```
curl -X PUT "localhost:9200/_snapshot/netology_backup?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "/var/lib/elasticsearch/snapshots",
    "compress": true
  }
}'
```

Ответ:

```
{
  "acknowledged" : true
}
```
<br>
Создайте индекс test с 0 реплик и 1 шардом и приведите в ответе список индексов. <br>

```
health status index            uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   .geoip_databases tUIEc-vfnED49ds_dsdfkj   1   0         42            0     41.1mb         41.1mb
green  open   test             5okKcWHIfkcdodcsdpofjm   1   0          0            0       226b           226b
```

Cписок файлов в директории со snapshot:

```
-rw-r--r-- 1 elasticsearch elasticsearch 1434 Jun  2 18:22 index-0
-rw-r--r-- 1 elasticsearch elasticsearch    8 Jun  2 18:22 index.latest
drwxr-xr-x 6 elasticsearch elasticsearch 4096 Jun  2 18:22 indices
-rw-r--r-- 1 elasticsearch elasticsearch 9737 Jun  2 18:22 meta-fzn6GSxgSX-JC9wHwIWhNA.dat
-rw-r--r-- 1 elasticsearch elasticsearch  458 Jun  2 18:22 snap-fzn6GSxgSX-JC9wHwIWhNA.dat
```


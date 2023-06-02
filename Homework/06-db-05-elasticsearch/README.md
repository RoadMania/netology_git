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

## Задание 1
Скриншот веб-интерфейса grafana со списком подключенных Datasource.
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/grafana_1.JPG"> </div> <br>

## Задание 2

- Утилизация CPU для nodeexporter (в процентах, 100-idle)
  - `100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle",job="nodeexporter"}[1m])) * 100)`
- CPULA 1/5/15
  - `node_load1{job="nodeexporter"}`
  - `node_load5{job="nodeexporter"}`
  - `node_load15{job="nodeexporter"}`
- Количество свободной оперативной памяти
  - `node_memory_MemFree_bytes{job=~"nodeexporter"}`
- Количество места на файловой системе
  - `node_filesystem_avail_bytes{job=~"nodeexporter",mountpoint="/",fstype!="rootfs"}` <br>
<br> 
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/grafana_2.JPG"> </div> <br>

## Задание 3
Cкриншот итоговой Dashboard
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/grafana_3.JPG"> </div> <br>
* за ночь данные изменились <br>
* для stat и gauge панелей вкладки alerts просто нет

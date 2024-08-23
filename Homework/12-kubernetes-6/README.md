# Домашнее задание к занятию «Хранение в K8s. Часть 1»

### Задание 1 

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_25.JPG"> </div>
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4. <br> <br>
Ссылка на манифест Deployment - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-6/deployment.yaml

------

### Задание 2

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода. <br>
`sudo microk8s kubectl -n volume1 exec -it test-daemonset-g5n69 -- sh`
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_26.JPG"> </div>
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2. <br> <br>
Ссылка на манифест DaemonSet - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-6/daemonset.yaml

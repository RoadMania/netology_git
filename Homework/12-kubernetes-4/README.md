# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_17.JPG"> </div>
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080. <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_18.JPG"> </div>
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_19.JPG"> </div>
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_20.JPG"> </div>
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4. <br>
Ссылка на манифест Deployment - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-4/deployment.yaml <br>
Ссылка на манифест Service - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-4/service.yaml <br>
Ссылка на манифест Pod - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-4/multitool.yaml

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

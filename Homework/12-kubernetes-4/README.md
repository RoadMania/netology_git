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
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

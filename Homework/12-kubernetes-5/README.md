# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»


### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool.
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_22.JPG"> </div>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_23.JPG"> </div>
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4. <br>
Ссылка на манифест Deployment c frontend - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-5/deploy_front.yaml <br>
Ссылка на манифест Deployment c back - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-5/deploy_back.yaml <br>
Ссылка на манифест service - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-5/service.yaml

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

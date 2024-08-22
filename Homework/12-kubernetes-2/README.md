# Домашнее задание к занятию «Базовые объекты K8S»

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod. <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_5.JPG"> </div>
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_6.JPG"> </div>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_7.JPG"> </div>

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_8.JPG"> </div>
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_9.JPG"> </div>

Ссылки на манифесты: <br>
Pod - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-2/pod.yaml <br>
Service - https://github.com/RoadMania/netology_git/blob/main/Homework/12-kubernetes-2/service.yaml

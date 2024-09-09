# Домашнее задание к занятию «Как работает сеть в K8s»

### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа

1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_34.JPG"> </div>
2. В качестве образа использовать network-multitool.
3. Разместить поды в namespace App.
4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.
5. Продемонстрировать, что трафик разрешён и запрещён.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_35.JPG"> </div> <br>
Видно, что frontend имеет доступ к самому себе и имеет доступ к приложению backend, но не имеет доступ к приложению cache.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_36.JPG"> </div> <br>
Видно, что backend имеет доступ к самому себе и имеет доступ к приложению cache, но не имеет доступ к приложению frontend.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_37.JPG"> </div> <br>
Видно, что cache имеет доступ к самому себе, но не имеет доступ к приложениям frontend и backend.

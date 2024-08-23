# Домашнее задание к занятию «Запуск приложений в K8S»

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку. <br> <br>
   Запуск multitool потребует указания альтернативного порта, так как порты 80 и 443 заняты. Для этого в манифест Deployment добавляем соответствующую переменную. <br> <br>
   <img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_11.JPG"> </div>
   
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования. (вариант ДО можно видеть на первом скриншоте) <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_12.JPG"> </div>
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_13.JPG"> </div>
5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_14.JPG"> </div>

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_15.JPG"> </div>
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_16.JPG"> </div>

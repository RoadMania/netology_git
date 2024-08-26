# Домашнее задание к занятию «Helm»

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_27.JPG"> </div>
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_28.JPG"> </div>
3. В переменных чарта измените образ приложения для изменения версии.

------
### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_29.JPG"> </div>
3. Продемонстрируйте результат.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_30.JPG"> </div>

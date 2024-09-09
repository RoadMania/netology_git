# Домашнее задание к занятию Troubleshooting

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.

----
1) При выполнении команды сразу сталкиваемся с тем, что в кластере нет указанных namespace (web и data). Создаю эти namespace и применяю манифест.
2) Проверяю статус приложений внутри подов. Видно, что с приложением пода auth-db всё нормально, а вот с web-consumer есть проблема. Он не может достучаться до auth-db по имени хоста.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_33.JPG"> </div>
3) Получил манифест деплоймента auth-db в yaml виде и поменял в нем namespace с data на web.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_31.JPG"> </div>
4) Применяю манифест обновленного деплоймента и проверяю логи пода web-consumer. Видно, что приложение в поде работает корректно. <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/kub_32.JPG"> </div>

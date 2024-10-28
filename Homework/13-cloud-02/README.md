# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»

## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

## Выполнение задания 1. Yandex Cloud

Поднятая инфраструктура в Yandex Cloud:
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud3.jpg"> </div> <br>
Хранилище: <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud6.jpg"> </div> <br>
Балансировщик: <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud5.jpg"> </div> <br>
Картинка из бакета: <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud4.jpg"> </div> 

Так же была проверена доступность картинки при отключении одной или двух других машин. Как результат - картинка видна. <br>
В конце уничтожаю все созданные резурсы командой ```terraform destroy --auto-approve``` <br>

Манифесты terraform:

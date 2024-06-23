# Домашнее задание к занятию "11.02 Микросервисы: принципы"

Вы работаете в крупной компанию, которая строит систему на основе микросервисной архитектуры.
Вам как DevOps специалисту необходимо выдвинуть предложение по организации инфраструктуры, для разработки и эксплуатации.

## Задача 1: API Gateway 

Предложите решение для обеспечения реализации API Gateway. Составьте сравнительную таблицу возможностей различных программных решений. На основе таблицы сделайте выбор решения.

Решение должно соответствовать следующим требованиям:
- Маршрутизация запросов к нужному сервису на основе конфигурации
- Возможность проверки аутентификационной информации в запросах
- Обеспечение терминации HTTPS

Обоснуйте свой выбор.

### Ответ:

Требования: |Nginx|Apache|Azure API Gateway|AWS Lambda|Tyk
:---|:---:|:---:|:---:|:---:|:---:
Маршрутизация запросов к нужному сервису на основе конфигурации |+|+|+|+|+ 
Возможность проверки аутентификационной информации в запросах |+|+|+|+|+
Обеспечение терминации HTTPS|+|+|+|+|+

Думаю оптимальным решением для реализации API Gateway будет использование Nginx, так как он имеет открытый исходный код, прост в конфигурировании и имеет большое комьюнити. Так же можно рассмотреть Tyk. Он бесплатный и имеет множество возможностей из коробки.

## Задача 2: Брокер сообщений

Составьте таблицу возможностей различных брокеров сообщений. На основе таблицы сделайте обоснованный выбор решения.

Решение должно соответствовать следующим требованиям:
- Поддержка кластеризации для обеспечения надежности
- Хранение сообщений на диске в процессе доставки
- Высокая скорость работы
- Поддержка различных форматов сообщений
- Разделение прав доступа к различным потокам сообщений
- Простота эксплуатации

Обоснуйте свой выбор.

## Ответ 2:
Требования: | Apache Kafka | RabbitMQ | Redis | ActiveMQ 
:---|:---:|:---:|:---:|:---:
Поддержка кластеризации для обеспечения надежности|+|+|+|+
Хранение сообщений на диске в процессе доставки|+|+|-|+
Высокая скорость работы|+|+|+|-
Поддержка различных форматов сообщений|+|+|+|-
Разделение прав доступа к различным потокам сообщений|+|+|+|+
Простота эксплуатации|+|+|+|+

Я бы предложил Kafka и RabbitMQ. Обе системы подходят по требованиям. У них хорошая отказоустойчивость, простые в настройке, быстрая обработка данных.
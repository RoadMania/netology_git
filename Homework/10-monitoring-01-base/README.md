## Задание 1

Вас пригласили настроить мониторинг на проект. На онбординге вам рассказали, что проект представляет из себя платформу для вычислений с выдачей текстовых отчётов, которые сохраняются на диск. Взаимодействие с платформой осуществляется по протоколу http. Также вам отметили, что вычисления загружают ЦПУ. Какой минимальный набор метрик вы выведите в мониторинг и почему?  

### Ответ:

1) Мониторинг работоспособности программного обеспечения: количество всех запросов к приложению и количество неудачных ответов пользователям.
2) Мониторинг работоспособности серверного оборудования: RAM, LAN, CPU, HDD, температура составляющих.
3) Мониторинг безопасности: отслеживать трафик их нестандартных мест и проверка актуальности сертификатов и их цепочек.

## Задание 2

Менеджер продукта, посмотрев на ваши метрики, сказал, что ему непонятно, что такое RAM/inodes/CPUla. Также он сказал, что хочет понимать, насколько мы выполняем свои обязанности перед клиентами и какое качество обслуживания. Что вы можете ему предложить?

### Ответ:

Я бы предложил настроить мониторинг функциональности продукта, сделать его более читаемым, где будет проще ориентироваться. Можно утвердить SLA в рамках которого будут указаны SLO для тех или иных метрик.

## Задание 3

Вашей DevOps-команде в этом году не выделили финансирование на построение системы сбора логов. Разработчики, в свою очередь, хотят видеть все ошибки, которые выдают их приложения. Какое решение вы можете предпринять в этой ситуации, чтобы разработчики получали ошибки приложения?

### Ответ:

Самый бюджетный вариант это создать скрипт, который вылавливает ошибки из логов и отправляет их разработчикам. Посредством вебхуков и иных инструментов, в зависимости от того, на каком стэке (какое ПО) используют разработчики. Если позволяет бюджет, можно воспользоваться специальным ПО, например, Sentry.

## Задание 4

Вы, как опытный SRE, сделали мониторинг, куда вывели отображения выполнения SLA = 99% по http-кодам ответов. Этот параметр вычисляется по формуле: summ_2xx_requests/summ_all_requests. Он не поднимается выше 70%, но при этом в вашей системе нет кодов ответа 5xx и 4xx. Где у вас ошибка?  

### Ответ:

Я думаю из-за того, что не учитываются 1хх и 3хх коды. <br>
Правильный вариант формулы будет выглядеть так:  (summ_2xx_requests + summ_1xx_requests + summ_3xx_requests)/summ_all_requests

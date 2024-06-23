10-monitoring-06-incident-management

## Задание

Составьте постмортем на основе реального сбоя системы GitHub в 2018 году.

Информацию о сбое можно изучить по ссылкам ниже:

* [краткое описание на русском языке](https://habr.com/ru/post/427301/);
* [развёрнутое описание на английском языке](https://github.blog/2018-10-30-oct21-post-incident-analysis/).

<br>
<br>

<table>
  <tr>
    <th>красткое описание инцидента</th>
    <td>После нескольких попыток создания Issue и записи комментариев к уже существующим — запись/комментарий визуально отображаются, а после перезагрузки — пропадают. </td>
  </tr>
  <tr>
    <th>причина инцидента</th>
    <td>Техническое обслуживание по замене неисправного оптического оборудования 100G привело к потере соединения между сетевым узлом на восточном побережье США и основным центром обработки данных на восточном побережье США.</td>
  </tr>
  <tr>
    <th>воздействие</th>
    <td>Недоступность трэкера и хуков.</td>
  </tr>
  <tr>
    <th>обнаружение</th>
    <td>Система мониторинга начала генерировать сообщения о различных ошибках. Ответственные инженеры обнаружили, что несколько MySQL кластеров находятся в состоянии ошибки. Primary и Secondary копии были рассинхронизированы, без возможности синхронизации.</td>
  </tr>
  <tr>
    <th>реакция</th>
    <td>Остановлены все процессы для предотвращения дальнейшей рассинхронизации. Был составлен план восстановления из бэкапа.</td>
  </tr>
  <tr>
    <th>восстановление</th>
    <td>Были созданы новые кластера баз данных MySQL. И загружены последние доступные бэкапы баз данных. Затем вручную были устраненые противоречия.</td>
  </tr>  
  <tr>
    <th>таймлайн</th>
    <td>
<ul>
<li>2018 October 21 22:52 UTC: Работы по замене сбойного сетевого оборудования в сети 100Гбит
<li>2018 October 21 22:54 UTC: Внутренние системы мониторинга начали генерировать оповещения, указывающие на многочисленные сбои в системах.</li>
<li>2018 October 21 23:07 UTC: Блокирование изменений</li>
<li>2018 October 21 23:13 UTC: Траблшутинг</li>
<li>2018 October 21 23:19 UTC: Остановка всех процессов для сохранения целостности данных	</li>
<li>2018 October 22 00:05 UTC: Разработка плана восстановления</li>
<li>2018 October 22 00:41 UTC: Процесса восстановления системы из бэкапа</li>
<li>2018 October 22 06:51 UTC: Несколько БД восстановлено. Обнаружено замедление при взаимодействии компонентов между серверами</li>
<li>2018 October 22 11:12 UTC: Все основные сервера восстановлены на восточном побережье. Отзывчивость сайта улучшилась</li>
<li>2018 October 22 13:15 UTC: Увеличение трафика на github.com</li>
<li>2018 October 22 16:24 UTC: Переключение в оригинальную топологию</li>
<li>2018 October 22 16:45 UTC: Балансировка нагрузки из-за накопившегося бэклога</li>
<li>2018 October 22 23:03 UTC: Вся очередь вебхуков и билдов обработалась</li>
</ul>
</td>
  </tr> 
  <tr>
    <th>последующие действия</th>
    <td>
<ul>
<li>Изменение настройки оркестратора: исключить переключение на реплику в другом регионе</li>
<li>Переход на новый механизм отчетности о статусе</li>
<li>Ускорение инициацивы по поддержка резервирования N+1 на уровне объекта.</li>
</ul>
</td>
  </tr>      
</table>
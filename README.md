БОГАТОВ АЛЕКСЕЙ

05-virt-02-iaac <br>
<b>Задание 1. </b><br>
Основным преимуществом подхода IaaC является "быстрая и эффективная разработка", "Стабильность среды, устранение дрейфа конфигураций" и "Ускорение производства и вывода продукта на рынок". <b>Главным</b> преимуществом IaaC является идемпотентность. <br>
<br><b>Задание 2. </b> <br>
Порог входа в Ansible очень низкий, он прост и удобен. Ещё одним преимуществом является простота и расширяемость. <br> Pull, потому что отсутствует единая точка отказа и хранения данных для доступа. <br>
<br><b>Задание 3. </b> <br>
![Image alt]([https://github.com/{RoadMania}/{netology_git}/raw/{main}/{path}/image.png](https://github.com/RoadMania/netology_git/blob/main/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA.JPG)) 
<br>
<br>
<br>
<br>
<br>
05-virt-01-basics. <br>
<b>Задание 1. </b><br>
Виртруализация - процесс, полностью эмулирующий "компьютер", с процессором, памятью, набором железа, от видеокарты, до жестких дисков.
Паравиртуализация, почти тоже самое, что и в предыдущем случае, но некоторые компоненты, например сетевые или дисковые (и другие) устройства могут быть доступны напрямую через вызовы наружу виртуальной машины. 
Виртуализация на уровне операционной системы — метод виртуализации, при котором ядро операционной системы поддерживает несколько изолированных экземпляров пространства пользователя, вместо одного. <br><br>
<b>Задание 2. </b>
<ul>
<li> Высоконагруженная база данных, чувствительная к отказу - физические сервера. Не вижу смысла в виртуализации, особенно при условии чувствительности к отказам. </li>
<li> Различные web-приложения - Виртуализация на уровне операционной системы. Хороший шанс применить контейнеризацию. </li>
<li> Windows системы для использования бухгалтерским отделом - паравиртуализация. Думаю, при использовании бухгалтерских приложений этот вариант лучше всего подходит. Чтобы у каждого был доступ (а-ля терминальный сервер) </li>
<li> Системы, выполняющие высокопроизводительные расчеты на GPU - физические сервера. Опять же не вижу смысла в принципе иметь какую-то виртуализацию. Подобные системы даже не всегда требуют веб-интерфейс </li> </ul>
<b>Задание 3. </b> <br>
1) VMWare - Универсальное решение для наших ОС, выполняющих базовые\общие функции, не требующие спец. оборудование. <br>
2) Xen - бесплатный и кроссплатформенный. <br>
3) Снова Xen. Бесплатный и максимально совместимый (Если можно выбрать платный вариант - то лучше Hyper-v, так как еще больше совместим с Microsoft-стэк) <br>
4) KVM - для линукс систем оптимальное решение, либо VMWare для платного решения. <br> <br>
<b>Задание 4. </b> <br>
Требуется целый набор специалистов различного профиля, данный способ виртуализации инфраструктуры является дорогостоящим и неэффективным в долгосрочной перспективе, поскольку, по мере развития технологий, компании стремятся обеспечить легкость в управлении, совместимость различных систем и масштабируемость инфраструктуры. Есть сложности с переносом данных с физических серверов на виртуальные. <br> Для минимизации проблем, думаю, следует просто отказаться от подобного метода и использовать единую систему.

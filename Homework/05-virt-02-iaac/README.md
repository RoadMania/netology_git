<a name="virt02"></a> 05-virt-02-iaac <br>
<b>Задание 1. </b><br>
Основным преимуществом подхода IaaC является "быстрая и эффективная разработка", "Стабильность среды, устранение дрейфа конфигураций" и "Ускорение производства и вывода продукта на рынок". <b>Главным</b> преимуществом IaaC является идемпотентность. <br>
<br><b>Задание 2. </b> <br>
1)Порог входа в Ansible очень низкий, он прост и удобен. Плюсом является еще то, Ansible использует существующую SSH инфраструктуру, в то время как другие требуют установки специального PKI-окружения. <br> 2)Pull, потому что отсутствует единая точка отказа и хранения данных для доступа. <br>
<br><b>Задание 3. </b> <br>
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/VBox.JPG"> </div> 
<br> <br>
spenc@bogatov:~$ vagrant -v <br>
Vagrant 2.2.14<br>

 spenc@bogatov:~$ ansible --version <br>
ansible 2.10.8<br>
  config file = None<br>
  configured module search path = ['/home/spenc/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']<br>
  ansible python module location = /usr/lib/python3/dist-packages/ansible<br>
  executable location = /usr/bin/ansible<br>
  python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110]

<a name="virt02"></a> 07-terraform-01-intro <br>
<div> Установка Terraform </div>
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform1.JPG"> </div> <br>
<b>Задание 1. </b><br>
1. Скачал репозиторий.
<div> 2. Личные данные не нужно хранить ни в каком из файлов. Это не безопасно. </div>
3. <div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform_pass.JPG"> </div> <br>
4. Первая ошибка говорит нам о том, что в блоке с ресурсами должно быть 2 лейбла (тип и имя). А у нас указан только тип. <br>
Решение: <b>resource "docker_image" "nginx_image" { </b> <br>
Вторая ошибка возникла из-за того, что имя в ресурсной группе начиналось с цифры. Достаточно убрать её и проблема исчезнет. <br>
5. <div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform_dockerPS.JPG"> </div>
6. Флаг <b> -auto-approve </b> пропускает подтверждение пользователя, перед применением изменений. Если вы где-то ошиблись или конфигурация была исправлена извне - использование этого флага может поломать инфраструктуру и создать конфликтные ситуации.
7. <div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform_tfstate.JPG"> </div>
8. 

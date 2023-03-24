<a name="virt02"></a> 07-terraform-02-YCloud <br><br>
<b>Задание 1. </b><br>
1,2,3) <div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraformVM.JPG"> </div> <br>
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/TerraformSSH.JPG"> </div>
4) Первая проблема была связана с лимитом на Virtual Private Cloud , которых по-умолчанию может быть всего 3. Пришлось удались созданную ранее сеть. <br>
Вторая проблема решилась добавлением ядер нашему ресурсу, потому что Stardart-v1 может содержать только 2 или 4 ядра. <br>
5) <b>preemptible = true</b> - параметр, который делает машину прерываемой. То есть это принудительная остановка ВМ, если с момента запуска виртуальной машины прошло 24 часа или если возникнет нехватка ресурсов для запуска обычной виртуальной машины в той же зоне доступности. <br>
<b>core_fraction</b> - уровни производительности vCPU. Этот уровень определяет долю вычислительного времени физических ядер, которую гарантирует vCPU.<br><br>
<b>Задание 2. </b><br>
1,2,3,4) <div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform_vars.JPG"> </div>
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform_vars_plan.JPG"> </div>
<b>Задание 3. </b><br>
1,2,3) <div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/terraform_vars.JPG"> </div>

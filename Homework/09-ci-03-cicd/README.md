09-ci-03-cicd

<b>Подготовка к выполнению</b> <br>

4) Запустите playbook, ожидайте успешного завершения.
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd1.JPG"> </div>
5) Проверьте готовность SonarQube через браузер
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd_sonarcube1.JPG"> </div>
7) Проверьте готовность Nexus через бразуер
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd_nexus.JPG"> </div>

<b>Знакомоство с SonarQube</b> <br>
1) Создайте новый проект, название произвольное. <br>
2) Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.
3) Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
4) Проверьте sonar-scanner --version.
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd_sonar.JPG"> </div>
6) Запустите анализатор против кода из директории example с дополнительным ключом -Dsonar.coverage.exclusions=fail.py. <br>
7) Посмотрите результат в интерфейсе.<br>
8) Исправьте ошибки, которые он выявил, включая warnings.<br>
9) Запустите анализатор повторно — проверьте, что QG пройдены успешно.<br>
10) Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.<br>
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd_sonar2.jpg"> </div>
<b>Знакомство с Nexus</b> <br>
4) В ответе пришлите файл maven-metadata.xml для этого артефекта.
<div> <img src="https://github.com/RoadMania/netology_git/blob/main/screens/cicd_nexus2.JPG"> </div>

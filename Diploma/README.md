# Дипломный практикум в Yandex.Cloud
<details><summary>Список заданий</summary>

  * [Цели:](#цели)
  * [Этапы выполнения:](#этапы-выполнения)
     * [Создание облачной инфраструктуры](#создание-облачной-инфраструктуры)
     * [Создание Kubernetes кластера](#создание-kubernetes-кластера)
     * [Создание тестового приложения](#создание-тестового-приложения)
     * [Подготовка cистемы мониторинга и деплой приложения](#подготовка-cистемы-мониторинга-и-деплой-приложения)
     * [Установка и настройка CI/CD](#установка-и-настройка-cicd)
  * [Что необходимо для сдачи задания?](#что-необходимо-для-сдачи-задания)
  * [Как правильно задавать вопросы дипломному руководителю?](#как-правильно-задавать-вопросы-дипломному-руководителю)

**Перед началом работы над дипломным заданием изучите [Инструкция по экономии облачных ресурсов](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD).**

---
## Цели:

1. Подготовить облачную инфраструктуру на базе облачного провайдера Яндекс.Облако.
2. Запустить и сконфигурировать Kubernetes кластер.
3. Установить и настроить систему мониторинга.
4. Настроить и автоматизировать сборку тестового приложения с использованием Docker-контейнеров.
5. Настроить CI для автоматической сборки и тестирования.
6. Настроить CD для автоматического развёртывания приложения.

---
## Этапы выполнения:


### Создание облачной инфраструктуры

Для начала необходимо подготовить облачную инфраструктуру в ЯО при помощи [Terraform](https://www.terraform.io/).

Особенности выполнения:

- Бюджет купона ограничен, что следует иметь в виду при проектировании инфраструктуры и использовании ресурсов;
Для облачного k8s используйте региональный мастер(неотказоустойчивый). Для self-hosted k8s минимизируйте ресурсы ВМ и долю ЦПУ. В обоих вариантах используйте прерываемые ВМ для worker nodes.

Предварительная подготовка к установке и запуску Kubernetes кластера.

1. Создайте сервисный аккаунт, который будет в дальнейшем использоваться Terraform для работы с инфраструктурой с необходимыми и достаточными правами. Не стоит использовать права суперпользователя
2. Подготовьте [backend](https://www.terraform.io/docs/language/settings/backends/index.html) для Terraform:  
   а. Рекомендуемый вариант: S3 bucket в созданном ЯО аккаунте(создание бакета через TF)
   б. Альтернативный вариант:  [Terraform Cloud](https://app.terraform.io/)
3. Создайте конфигурацию Terrafrom, используя созданный бакет ранее как бекенд для хранения стейт файла. Конфигурации Terraform для создания сервисного аккаунта и бакета и основной инфраструктуры следует сохранить в разных папках.
4. Создайте VPC с подсетями в разных зонах доступности.
5. Убедитесь, что теперь вы можете выполнить команды `terraform destroy` и `terraform apply` без дополнительных ручных действий.
6. В случае использования [Terraform Cloud](https://app.terraform.io/) в качестве [backend](https://www.terraform.io/docs/language/settings/backends/index.html) убедитесь, что применение изменений успешно проходит, используя web-интерфейс Terraform cloud.

Ожидаемые результаты:

1. Terraform сконфигурирован и создание инфраструктуры посредством Terraform возможно без дополнительных ручных действий, стейт основной конфигурации сохраняется в бакете или Terraform Cloud
2. Полученная конфигурация инфраструктуры является предварительной, поэтому в ходе дальнейшего выполнения задания возможны изменения.

---
### Создание Kubernetes кластера

На этом этапе необходимо создать [Kubernetes](https://kubernetes.io/ru/docs/concepts/overview/what-is-kubernetes/) кластер на базе предварительно созданной инфраструктуры.   Требуется обеспечить доступ к ресурсам из Интернета.

Это можно сделать двумя способами:

1. Рекомендуемый вариант: самостоятельная установка Kubernetes кластера.  
   а. При помощи Terraform подготовить как минимум 3 виртуальных машины Compute Cloud для создания Kubernetes-кластера. Тип виртуальной машины следует выбрать самостоятельно с учётом требовании к производительности и стоимости. Если в дальнейшем поймете, что необходимо сменить тип инстанса, используйте Terraform для внесения изменений.  
   б. Подготовить [ansible](https://www.ansible.com/) конфигурации, можно воспользоваться, например [Kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)  
   в. Задеплоить Kubernetes на подготовленные ранее инстансы, в случае нехватки каких-либо ресурсов вы всегда можете создать их при помощи Terraform.
2. Альтернативный вариант: воспользуйтесь сервисом [Yandex Managed Service for Kubernetes](https://cloud.yandex.ru/services/managed-kubernetes)  
  а. С помощью terraform resource для [kubernetes](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster) создать **региональный** мастер kubernetes с размещением нод в разных 3 подсетях      
  б. С помощью terraform resource для [kubernetes node group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group)
  
Ожидаемый результат:

1. Работоспособный Kubernetes кластер.
2. В файле `~/.kube/config` находятся данные для доступа к кластеру.
3. Команда `kubectl get pods --all-namespaces` отрабатывает без ошибок.

---
### Создание тестового приложения

Для перехода к следующему этапу необходимо подготовить тестовое приложение, эмулирующее основное приложение разрабатываемое вашей компанией.

Способ подготовки:

1. Рекомендуемый вариант:  
   а. Создайте отдельный git репозиторий с простым nginx конфигом, который будет отдавать статические данные.  
   б. Подготовьте Dockerfile для создания образа приложения.  
2. Альтернативный вариант:  
   а. Используйте любой другой код, главное, чтобы был самостоятельно создан Dockerfile.

Ожидаемый результат:

1. Git репозиторий с тестовым приложением и Dockerfile.
2. Регистри с собранным docker image. В качестве регистри может быть DockerHub или [Yandex Container Registry](https://cloud.yandex.ru/services/container-registry), созданный также с помощью terraform.

---
### Подготовка cистемы мониторинга и деплой приложения

Уже должны быть готовы конфигурации для автоматического создания облачной инфраструктуры и поднятия Kubernetes кластера.  
Теперь необходимо подготовить конфигурационные файлы для настройки нашего Kubernetes кластера.

Цель:
1. Задеплоить в кластер [prometheus](https://prometheus.io/), [grafana](https://grafana.com/), [alertmanager](https://github.com/prometheus/alertmanager), [экспортер](https://github.com/prometheus/node_exporter) основных метрик Kubernetes.
2. Задеплоить тестовое приложение, например, [nginx](https://www.nginx.com/) сервер отдающий статическую страницу.

Способ выполнения:
1. Воспользоваться пакетом [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus), который уже включает в себя [Kubernetes оператор](https://operatorhub.io/) для [grafana](https://grafana.com/), [prometheus](https://prometheus.io/), [alertmanager](https://github.com/prometheus/alertmanager) и [node_exporter](https://github.com/prometheus/node_exporter). Альтернативный вариант - использовать набор helm чартов от [bitnami](https://github.com/bitnami/charts/tree/main/bitnami).

2. Если на первом этапе вы не воспользовались [Terraform Cloud](https://app.terraform.io/), то задеплойте и настройте в кластере [atlantis](https://www.runatlantis.io/) для отслеживания изменений инфраструктуры. Альтернативный вариант 3 задания: вместо Terraform Cloud или atlantis настройте на автоматический запуск и применение конфигурации terraform из вашего git-репозитория в выбранной вами CI-CD системе при любом комите в main ветку. Предоставьте скриншоты работы пайплайна из CI/CD системы.

Ожидаемый результат:
1. Git репозиторий с конфигурационными файлами для настройки Kubernetes.
2. Http доступ на 80 порту к web интерфейсу grafana.
3. Дашборды в grafana отображающие состояние Kubernetes кластера.
4. Http доступ на 80 порту к тестовому приложению.
---
### Установка и настройка CI/CD

Осталось настроить ci/cd систему для автоматической сборки docker image и деплоя приложения при изменении кода.

Цель:

1. Автоматическая сборка docker образа при коммите в репозиторий с тестовым приложением.
2. Автоматический деплой нового docker образа.

Можно использовать [teamcity](https://www.jetbrains.com/ru-ru/teamcity/), [jenkins](https://www.jenkins.io/), [GitLab CI](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/) или GitHub Actions.

Ожидаемый результат:

1. Интерфейс ci/cd сервиса доступен по http.
2. При любом коммите в репозиторие с тестовым приложением происходит сборка и отправка в регистр Docker образа.
3. При создании тега (например, v1.0.0) происходит сборка и отправка с соответствующим label в регистри, а также деплой соответствующего Docker образа в кластер Kubernetes.

---
## Что необходимо для сдачи задания?

1. Репозиторий с конфигурационными файлами Terraform и готовность продемонстрировать создание всех ресурсов с нуля.
2. Пример pull request с комментариями созданными atlantis'ом или снимки экрана из Terraform Cloud или вашего CI-CD-terraform pipeline.
3. Репозиторий с конфигурацией ansible, если был выбран способ создания Kubernetes кластера при помощи ansible.
4. Репозиторий с Dockerfile тестового приложения и ссылка на собранный docker image.
5. Репозиторий с конфигурацией Kubernetes кластера.
6. Ссылка на тестовое приложение и веб интерфейс Grafana с данными доступа.
7. Все репозитории рекомендуется хранить на одном ресурсе (github, gitlab)

</details>

## Выполнение дипломного практикума:
### Создание облачной инфраструктуры

Для начала разворачиваю в Yandex Cloud новое окружение и полностью его настраиваю. <br>
Для работы с terraform создаю новую директорию "diploma". Настраиваю [providers.tf](https://github.com/RoadMania/netology_git/blob/main/Diploma/terraform-s3/providers.tf) с переменными в [variables.tf](https://github.com/RoadMania/netology_git/blob/main/Diploma/terraform-s3/variables.tf)
и выполняю начальную инициализацию. <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma1.JPG"> </div>
<br>
Для работы с облаком создаём сервисный аккаунт с правами "editor" с помошью следующего кода:
```
# Creat a service account for Terraform
resource "yandex_iam_service_account" "service" {
  folder_id = var.folder_id
  name      = var.account_name
}

# Grant a role "editor" to created service account
resource "yandex_resourcemanager_folder_iam_member" "service_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.service.id}"
}
```
Создадим статический ключ доступа и S3-bucket:

```
# Create static access key for service account
resource "yandex_iam_service_account_static_access_key" "terraform_service_account_key" {
  service_account_id = yandex_iam_service_account.service.id
}

# Use access key to create new bucket
resource "yandex_storage_bucket" "tf-bucket" {
  bucket     = "bogatov-diploma-bucket"
  access_key = yandex_iam_service_account_static_access_key.terraform_service_account_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.terraform_service_account_key.secret_key

  anonymous_access_flags {
    read = false
    list = false
  }

  force_destroy = true
```
Применяем код:
<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma2.JPG"> </div>
Так же через CLI проверим, что необходимая инфраструктура создалась.
<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma3.JPG"> </div>
После создания бакета я настрою его для использования в качестве backend для Terraform:

```
terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket = "bogatov-diploma-bucket"
    region = "ru-central1"
    key = "diploma/terraform.tfstate"
    skip_region_validation = true
    skip_credentials_validation = true
  }
}
```
Создаю VPC с подсетями в разных зонах доступности:

```
resource "yandex_vpc_network" "diplom" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "diplom-subnet1" {
  name           = var.subnet1
  zone           = var.zone1
  network_id     = yandex_vpc_network.diplom.id
  v4_cidr_blocks = var.cidr1
}

resource "yandex_vpc_subnet" "diplom-subnet2" {
  name           = var.subnet2
  zone           = var.zone2
  network_id     = yandex_vpc_network.diplom.id
  v4_cidr_blocks = var.cidr2
}

variable "zone1" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone2" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cidr1" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "cidr2" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "diplom"
}

variable "subnet1" {
  type        = string
  default     = "diplom-subnet1"
  description = "subnet name"
}

variable "subnet2" {
  type        = string
  default     = "diplom-subnet2"
  description = "subnet name"
}
```
<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma4.JPG"> </div> <br>

На картинке видно, что backend с типом s3 успешно настроен. <br>
Скрин ниже показывает, что сеть и подсети успешно создались.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma5.JPG"> </div>

Для Kubernetes кластера использую один узел - Master, и два узла - Worker.
С помощью [master.tf](https://github.com/RoadMania/netology_git/blob/main/Diploma/terraform/master.tf) и [worker.tf](https://github.com/RoadMania/netology_git/blob/main/Diploma/terraform/worker.tf) деплоим ресурсы.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma6.JPG"> </div> <br>

С помощью команды `terraform destroy` уничтожаем все созданные ресурсы и убеждаемся в работающей автоматизации. 

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma7.JPG"> </div> <br>

### Создание Kubernetes кластера

Выбрал вариант самостоятельной установки Kubernetes кластера при помощи [Kubespray](https://github.com/kubernetes-sigs/kubespray)

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma8.JPG"> </div> <br>

При выполнении плейбука всплыло множество ошибок, начиная с версии ansible, заканчивая ssh соединением. После исправления снова запускаю плей `sudo ansible-playbook -i inventory/mycluster/inventory.ini -u ubuntu --become --become-user=root --private-key=~/.ssh/id_ed25519 -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"' cluster.yml --flush-cache`

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma9_1.JPG"> </div> <br>

Не смотря на то, что плейбук выполнился без проблем, тем не менеее подключиться к master узлу я не мог. Для решения проблемы создал отдельный [playbook](https://github.com/RoadMania/netology_git/blob/main/Diploma/ansible/SSH_Docker_Install.yaml), который добавляет публичный ssh-ключ в autorized_keys таргет машины и вдовесок установит Docker, который пригодится для CI\CD. Ниже видим, что подключение успешно выполнено.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma10_1.JPG"> </div> <br>

На мастер ноде вводим команды `kubectl get pods --all-namespaces` и `kubectl get nodes` для отображения созданного кластера. <br> Ноды и поды находятся в состоянии ready и running.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma11.JPG"> </div> <br>

### Создание тестового приложения

Создал новый [репозиторий](https://github.com/RoadMania/netology_diploma_site) для тестового приложения, где будет находиться статичная страница index.html и прочие файлы.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma12.JPG"> </div> <br>

Логинимся в DockerHub <br>
Для справки: чтобы запушить образ, эту команду нужно было использовать с ключиком -p. На скрине не показываю пароль по понятным причинам.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma13.JPG"> </div> <br>

Создаём докер образ и сразу проверяем его статус.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma14_1.JPG"> </div> <br>

Командой `sudo docker push spencer98/netology-diploma-site:0.1` пушим образ в DockerHub и смотрим результат.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma15_1.JPG"> </div> <br>

Ссылка на образ в DockerHub: https://hub.docker.com/r/spencer98/netology-diploma-site

### Подготовка системы мониторинга и деплой приложения

Для доступа к Grafana снаружи кластера Kubernetes будем использовать тип сервиса NodePort. <br> 

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

Для этого выносим дефолтные значения в файл helm.yaml командой `helm show values prometheus-community/kube-prometheus-stack > helm-prometheus/helm.yaml`, предварительно создав нужную директорию. 
В этом файле меняем сервис и порт. <br> 

Используем helm с заранее готовым файлом значений [helm.yaml](https://github.com/RoadMania/netology_git/blob/main/Diploma/k8s_cluster/helm.yaml) и выполняем установку prometheus-community командой: <br> `helm upgrade --install monitoring prometheus-community/kube-prometheus-stack --create-namespace -n m
onitoring -f helm-prometheus/helm.yaml` <br>

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma16_1.JPG"> </div> <br>

Можем идти проверять результат.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma17.JPG"> </div> <br>

Меняю стандартный пароль на новый. <br>

Ссылка на Dashboard: http://158.160.32.244:30050/d/efa86fd1d0c121a26444b636a3f509a8/kubernetes-compute-resources-cluster?from=now-1h&to=now&timezone=utc&var-datasource=prometheus&var-cluster=&refresh=10s

Credensials:
 - логин: admin
 - пароль: admin_netology

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma18.JPG"> </div> <br>

Система мониторинга была успешно развернута.

Теперь развернём тестовое приложение в кластере.

Для справки: первая попытка оказалась неудачной, потому что имя контейнера в моём манифесте Kubernetes не соответствовало правилам именования, установленным стандартом RFC 1123. А именно были использованы нижние подчёркивания (netology_diploma_site). Пришлось пересобрать образ и заново его залить, но уже с правильным названием (netology-diploma-site).

Создаём namespace `kubectl create namespace diploma-site`

Применяем манифест `kubectl apply -f deployment.yaml -n diploma-site`

Убеждаемся в работоспособности.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma19.JPG"> </div> <br>

Ссылка на манифест deployment.yaml: https://github.com/RoadMania/netology_git/blob/main/Diploma/k8s_cluster/deployment.yaml

Теперь нам нужно получить доступ к web-интерфейсу. 

Применяем [service.yaml](https://github.com/RoadMania/netology_git/blob/main/Diploma/k8s_cluster/service.yaml) манифест и проверим результат. 

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma20.JPG"> </div> <br>

Приложение работает по ссылке: http://158.160.40.177:30051/

### Установка и настройка CI/CD

Для выполнения этой задачи я выбрал GitHab Actions и созданный ранее [репозиторий](https://github.com/RoadMania/netology_diploma_site).

Настраиваем агента (Runner). Политика github actions запрещает использование root пользователя, поэтому для пайплайна создаю нового пользователя GitHub и выдаю ему sudo права (это понадобится для Docker).

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma21_1.JPG"> </div> <br>

В [github_actions.yml](https://github.com/RoadMania/netology_diploma_site/blob/main/.github/workflows/github_actions.yml) пишу шаги, которые необходимо выполнить для сборки образа и отправки его в DockerHub при изменении репозитория.


```
steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Determine Docker tag
        id: docker_tag
        run: |
          if [ "${{ github.ref }}" == "refs/heads/main" ]; then
            echo "tag=latest" >> $GITHUB_ENV
          else
            echo "tag=${GITHUB_REF##*/}" >> $GITHUB_ENV
          fi

      - name: Build Docker image
        run: |
          sudo docker build . -t spencer98/netology-diploma-site:${{ env.tag }}

      - name: Push Docker image
        run: |
          echo "${{ secrets.DOCKER_PASSWORD }}" | sudo docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
          sudo docker push spencer98/netology-diploma-site:${{ env.tag }}
  ```
  

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma23_1.JPG"> </div> <br>

Так же проверим сам DockerHub: 

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma24.JPG"> </div> <br>

Сборка прошла успешно (image получил тег latest, так как при коммите я ничего не указал)

Список изменений для наглядности. Эта информация нам понадобится для проверки следующего шага с Kubernetes.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma25_1.JPG"> </div> <br>

Теперь приступаем ко второму stage, который обновит приложение в kunernetes кластере.

```
      - name: Set up Kubernetes context
        run: |
          echo "${{ secrets.KUBE_CONFIG }}" > kubeconfig
          export KUBECONFIG=$(pwd)/kubeconfig

      - name: Deploy to Kubernetes
        run: |
          sudo kubectl set image deployment/diplom-app netology-diploma-site=spencer98/netology-diploma-site:${{ env.tag }} -n diploma-site
          sudo kubectl rollout status deployment/diplom-app -n diploma-site
```

Проверим результат: 

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma26.JPG"> </div> <br>

В конце попробуем внести изменения с указанием тега. 

С помощью git делаю небольшой фикс и с указанием тега пуляю изменения в репу. Это сразу же триггерит наш пайплайн. Как итог - успешно выполненные stages:

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma27.JPG"> </div> <br>

и свежий image в DockerHub.

<img src="https://github.com/RoadMania/netology_git/blob/main/Diploma/screens/diploma28.JPG"> </div> <br>

Для справки: в начале выполнения пайплайна столкнулся с ошибкой Error: Cannot perform an interactive login from a non TTY device. Как оказалось, эта ошибка была вызвана тем, что моя локальная переменная c паролем была protected. После отключения этого параметра пайплайн с тегом прошёл без проблем. 


### Итоги выполненной работы:
1) Репозиторий с конфигурационными файлами Terraform: <br>
https://github.com/RoadMania/netology_git/tree/main/Diploma/terraform-s3 <br>
https://github.com/RoadMania/netology_git/tree/main/Diploma/terraform

2) Репозиторий с конфигурацией ansible: <br>
был использовал репозиторий Kubespray https://github.com/kubernetes-sigs/kubespray

3) Репозиторий с Dockerfile тестового приложения и ссылка на собранный docker image: <br>
https://github.com/RoadMania/netology_diploma_site <br>
https://hub.docker.com/repository/docker/spencer98/netology-diploma-site/general

4) Репозиторий с конфигурацией Kubernetes кластера: <br>
https://github.com/RoadMania/netology_git/tree/main/Diploma/k8s_cluster

5) Ссылка на тестовое приложение и веб интерфейс Grafana с данными доступа: <br>
http://89.169.153.104:30051 <br>
http://158.160.32.244:30050/d/efa86fd1d0c121a26444b636a3f509a8/kubernetes-compute-resources-cluster?from=now-1h&to=now&timezone=utc&var-datasource=prometheus&var-cluster=&refresh=10s (admin - admin_netology)

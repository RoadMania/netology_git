# Домашнее задание к занятию «Безопасность в облачных провайдерах»

Используя конфигурации, выполненные в рамках предыдущих домашних заданий, нужно добавить возможность шифрования бакета.

---
## Задание 1. Yandex Cloud

1. С помощью ключа в KMS необходимо зашифровать содержимое бакета:

 - создать ключ в KMS;
 - с помощью ключа зашифровать содержимое бакета, созданного ранее.
2. (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:

 - создать сертификат;
 - создать статическую страницу в Object Storage и применить сертификат HTTPS;
 - в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).

## Выполнение задания 1. Yandex Cloud
Создаём роль для службы KMS, которая даст возможность зашифровывать и расшифровывать данные:

```
resource "yandex_resourcemanager_folder_iam_member" "sa-editor-encrypter-decrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.service.id}"
}
```

Создаём симметричный ключ шифрования:

```
resource "yandex_kms_symmetric_key" "secret-key" {
  name              = "netology-symetric-key"
  description       = "netology-symetric-key"
  default_algorithm = "AES_128"
  rotation_period   = "24h"
}
```

Активируем ключ шифрования к созданному ранее бакету:

```
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.secret-key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
```

<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud7.jpg"> </div> <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud8.jpg"> </div> <br>
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud9.jpg"> </div> <br>

Во втором задании сертификат застрял в статусе Validating, так как у меня нет собственного домена. <br> Но для общего понимания всё равно его создал.
<img src="https://github.com/RoadMania/netology_git/blob/main/screens/cloud10.jpg"> </div> <br>

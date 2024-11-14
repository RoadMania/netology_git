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

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 1"
}

locals {
  folder_id = "b1g90ot7h5iou65kpls8"
}

provider "yandex" {
  cloud_id  = "b1g4aa5s77qtes5u9nq4"
  folder_id = local.folder_id
}

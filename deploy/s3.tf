resource "yandex_iam_service_account" "deploy" {
  name = "aurora-storage-deploy"
}

resource "yandex_resourcemanager_folder_iam_member" "deploy-editor" {
  folder_id = local.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.deploy.id}"
}

resource "yandex_iam_service_account_static_access_key" "deploy-static-key" {
  service_account_id = yandex_iam_service_account.deploy.id
  description        = "storage key"
}

/* disable for now, SA key looks broken
resource "yandex_storage_bucket" "this" {
  access_key = yandex_iam_service_account_static_access_key.deploy-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.deploy-static-key.secret_key

  bucket = "aurora"

  max_size = 1073741824

  website {
    index_document = "index.html"
  }

  acl = "public-read"
}
*/

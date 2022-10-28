resource "yandex_iam_service_account" "db-writer" {
  name = "db-writer"
}

resource "yandex_iam_service_account" "db-reader" {
  name = "db-reader"
}

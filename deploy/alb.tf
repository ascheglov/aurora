resource "yandex_alb_backend_group" "this" {
  folder_id = "b1gs1ft3ec69542eqtf2"

  name = "aurora-s3"

  http_backend {
    name = "main"

    storage_bucket = "aurora"
    weight         = 1
  }

  timeouts {}
}

resource "yandex_alb_virtual_host" "this" {
  authority = [
    "a.ujkl.ru",
    "aurora.ujkl.ru",
  ]

  http_router_id = "ds703r7cntqhvqe8rkku"
  name           = "aurora"

  route {
    name = "index"

    http_route {
      http_match {
        path {
          exact = "/"
        }
      }

      http_route_action {
        backend_group_id = yandex_alb_backend_group.this.id
        prefix_rewrite   = "/index.html"
        timeout          = "1m"
      }
    }
  }
  route {
    name = "bucket"

    http_route {
      http_match {
        path {
          prefix = "/"
        }
      }

      http_route_action {
        backend_group_id = yandex_alb_backend_group.this.id
        timeout          = "1m"
      }
    }
  }

  timeouts {}
}

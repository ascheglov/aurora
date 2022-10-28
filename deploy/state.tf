terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "aurora-terraform-state"
    key      = "state.tfstate"
    region   = "us-east-1"

    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
  }
}

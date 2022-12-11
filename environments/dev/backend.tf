terraform {
  backend "s3" {
    bucket = "demo-terraform-newrelic"
    key    = "terraform/dev/infra.tfstate"
    region = "ap-northeast-1"
  }
}
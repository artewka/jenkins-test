terraform {
  backend "s3" {
    bucket = "terraform-art"
    key    = "terraform/backend"
    region = "eu-central-1"
  }
}
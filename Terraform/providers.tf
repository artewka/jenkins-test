terraform {
  required_providers {
    # cloudflare = {
    #   source = "cloudflare/cloudflare"
    #   version = "~> 3.0"
    # }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  # access_key = var.access_key
  # secret_key = var.secret_key
   region     = "eu-central-1"
}


# provider "cloudflare" {
#    email = "shadak1997@gmail.com"
#    api_key = var.api_key
#    version = "~> 3.0"
# }

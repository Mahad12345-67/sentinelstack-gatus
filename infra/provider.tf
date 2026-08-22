terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-gatus-ecs-rick"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region         = "eu-north-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-north-1"
}
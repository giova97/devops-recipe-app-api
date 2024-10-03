terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "devops-gio"
    key            = "tf-state-setup"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "devops-recipe-app-api-lock"
  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Environment = "terraform.workspace"
      Project     = var.project
      Contact     = var.contact
      ManagedBy   = "Terraform/setup"
    }
  }
}


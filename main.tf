terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # bucket = "rwa-terraform-jenkins"
    # key = "start/tf/terraform_tfstate"
    # region = "us-east-1"
    # Integrado e utilizando as variáveis de ambiente no Jenkins
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_regiao
}



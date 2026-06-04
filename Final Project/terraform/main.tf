# This block tells Terraform which provider to use
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# This sets the AWS region
provider "aws" {
  region = "us-west-2"
}

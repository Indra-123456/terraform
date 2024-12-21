terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.81.0"
    }
  }

  backend "s3" {
    bucket = "76s-remote-state"
    key    = "foreach"
    region = "us-east-1"
    dynamodb_table = "76s-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}




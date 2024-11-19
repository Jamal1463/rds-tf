terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

# Backend state   
  backend "s3" {
    bucket = "rds-devops-terraform-state"
    # key    = "dev/vpc.tfstate"
    region         = "us-west-2"
    dynamodb_table = "dynamodb-terraform-state-lock"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "state_lock" {
  name         = "dynamodb-terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
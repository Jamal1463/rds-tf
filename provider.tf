terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
# Need to create s3 bucket
# Backend state 
 
  backend "s3" {
    bucket = "sa-bucket-virginia123"
    key    = "dev/terraform.tfstate"
    region         = "us-east-1"
  #  dynamodb_table = "dynamodb-terraform-state-lock"
  }

}

provider "aws" {
  region = "us-east-1"
}
/*
resource "aws_dynamodb_table" "state_lock" {
  name         = "dynamodb-terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
*/
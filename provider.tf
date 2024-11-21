terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
# Backend state 
/* 
  backend "s3" {
    bucket = "sa-bucket-virginia123"
    key    = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rds_bucket_lock"
  }
*/
}

provider "aws" {
  region = "us-east-1"
}

# Create State Lock with DynamoDB
/*
resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name         = "rds_bucket_lock"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"

  }
}
*/
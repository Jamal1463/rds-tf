#Create S3 bucket
/*
resource "aws_s3_bucket" "enterprise_backend_state" {
  bucket = "sa-bucket-virginia123"

  lifecycle {
    prevent_destroy = false
  }
}
*/
# S3 versioning Enabled
/*

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.enterprise_backend_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
*/

#S3 SS encryption 
/*
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.enterprise_backend_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
*/
resource "aws_security_group" "demo-rds-sg" {
  name        = var.security_group_name
  description = "Created By Terraform"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "aws_rds" {
  allocated_storage      = 30
  identifier             = var.db_identifier
  db_name                = var.dbname
  engine                 = var.dbengine
  engine_version         = var.engine_version
  instance_class         = var.rds_instance_type
  username               = var.username
  password               = var.password
  publicly_accessible    = true
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.demo-rds-sg.id]
}
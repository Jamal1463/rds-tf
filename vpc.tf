###############
##### VPC #####
###############

resource "aws_vpc" "rds-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "RDS VPC"
  }
}
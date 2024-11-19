################################
##### Private Subnet db - 1 ####
################################

resource "aws_subnet" "wp_rds_subnet-1" {
  vpc_id                  = aws_vpc.rds-vpc.id
  cidr_block              = var.rds-private-db-subnet-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "RDS-Private-Subnet-1 | DB Tier"
  }
}

################################
##### Private Subnet db - 2 ####
################################

resource "aws_subnet" "wp_rds_subnet-2" {
  vpc_id                  = aws_vpc.rds-vpc.id
  cidr_block              = var.rds-private-db-subnet-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "RDS-Private-Subnet-2 | DB Tier"
  }
}
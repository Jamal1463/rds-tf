resource "aws_db_subnet_group" "wp_rds_subnet_group" {
  name       = "wp_rds"
  subnet_ids = [aws_subnet.wp_rds_subnet-1.id, aws_subnet.wp_rds_subnet-2.id]
  tags = {
    Name = "WP RDS"
  }
}
resource "aws_db_subnet_group" "wp_rds_subnet_group" {
  name       = "wp_rds"
  subnet_ids = [aws_subnet.myprivatesubnet_1a.id, aws_subnet.myprivatesubnet_1b.id]
  tags = {
    Name = "WP RDS"
  }
}
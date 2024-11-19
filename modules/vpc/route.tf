resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-db-route-table",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route" "db" {
  count = var.create_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.db.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.main[count.index].id
}
resource "aws_network_acl" "db" {
    vpc_id = aws_vpc.main.id

    dynamic "ingress" {
        for_each = toset(range(length(var.ingress_db_nacl_from_port)))
        content {
            rule_no    = var.ingress_db_nacl_rule_no[ingress.key]
            action     = var.ingress_db_nacl_action[ingress.key]
            from_port  = var.ingress_db_nacl_from_port[ingress.key]
            to_port    = var.ingress_db_nacl_to_port[ingress.key]
            protocol   = var.ingress_db_nacl_protocol[ingress.key]
            cidr_block = var.ingress_db_nacl_cidr_block[ingress.key]
        }
    }

    dynamic "egress" {
        for_each = toset(range(length(var.egress_db_nacl_from_port)))
        content {
            rule_no    = var.egress_db_nacl_rule_no[egress.key]
            action     = var.egress_db_nacl_action[egress.key]
            from_port  = var.egress_db_nacl_from_port[egress.key]
            to_port    = var.egress_db_nacl_to_port[egress.key]
            protocol   = var.egress_db_nacl_protocol[egress.key]
            cidr_block = var.egress_db_nacl_cidr_block[egress.key]
        }
    }
    tags = merge(
    {
        Name        = "${var.environment}-${var.application}-db-subnet-nacl",
        Environment = var.environment,
        Owner       = var.owner,
        CostCenter  = var.cost_center,
        Application = var.application
    },
    var.tags
    )
}
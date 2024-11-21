# Network Vars
region              = "us-east-1"
subnet_ids          = ["subnet-06ae908a2723ceeeb", "subnet-01150f08c0084f2f7", "subnet-003fff18b9a9506bb"]
multi_az            = false
publicly_accessible = true

# DB Vars
db_engine                   = "mysql"
db_storage_type             = "gp2"
db_username                 = "devopscamp"
db_instance_class           = "db.t2.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "rdssecret"

# Security Group Vars
from_port  = 3306
to_port    = 3306
protocol   = "tcp"
cidr_block = ["0.0.0.0/0"]

# Backup vars
backup_retention_period  = 7
delete_automated_backups = true
copy_tags_to_snapshot    = true
skip_final_snapshot      = true
apply_immediately        = true

# Tag Vars
owner       = "rds-devops"
environment = "dev"
cost_center = "rds-devops"
application = "rds-devops-commerce"
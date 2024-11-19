####################
## VPC CIDR Block ##
####################

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC_cidr block"
  type        = string
}

####################
## DB CIDR Block 1 #
####################

variable "rds-private-db-subnet-1-cidr" {
  default     = "10.0.1.0/24"
  description = "rds-private_db_subnet1"
  type        = string
}

####################
## DB CIDR Block 2 #
####################

variable "rds-private-db-subnet-2-cidr" {
  default     = "10.0.2.0/24"
  description = "rds-private_db_subnet2"
  type        = string
}
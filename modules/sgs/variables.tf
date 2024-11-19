variable "region" {
  type        = string
  description = "Region of the security group."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC associated with the security group."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the EC2 security group resources."
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource."
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource."
}

variable "create_ingress_cidr" {
  type        = bool
  description = "Enable or disable CIDR block ingress rules."
}

variable "create_ingress_sg" {
  type        = bool
  description = "Enable or disable Security Groups ingress rules."
}

variable "create_egress_cidr" {
  type        = bool
  description = "Enable or disable CIDR block egress rules."
}

variable "create_egress_sg" {
  type        = bool
  description = "Enable or disable Security Groups egress rules."
}
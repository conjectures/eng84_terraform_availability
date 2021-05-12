
# VPC vars
variable "vpc_name" {
  default = "eng84_alexis_terraform_vpc"
}

# Subnet Vars
variable "subnet_name_A" {
  default = "eng84_alexis_terraform_subnet_A"
}
variable "subnet_name_B" {
  default = "eng84_alexis_terraform_subnet_B"
}
variable "subnet_name_C" {
  default = "eng84_alexis_terraform_subnet_C"
}

# Application vars
variable "application_name" {
  default = "eng84_alexis_terraform_application"
}
variable "database_name" {
  default = "eng84_alexis_terraform_database"
}

variable "webapp_ami_id" {
  default = "ami-042af9229265c27d0"
}

# Security Group vars
variable "security_group_name_public" {
  default = "eng84_alexis_terraform_sg_public"
}
variable "security_group_name_private" {
  default = "eng84_alexis_terraform_sg_private"
}


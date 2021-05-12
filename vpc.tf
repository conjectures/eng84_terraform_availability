

resource "aws_vpc" "alexis_vpc" {
  cidr_block = "12.1.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name
  }
}


 resource "aws_internet_gateway" "alexis_igw" {
  vpc_id = aws_vpc.alexis_vpc.id
  tags = {
    Name = "eng84_alexis_terraform_igw"
  }
}




resource "aws_default_route_table" "alexis_rt_default" {
  default_route_table_id = aws_vpc.alexis_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alexis_igw.id
  }
  tags = {
    Name = "eng84_alexis_terraform_rt_default"
  }
}


resource "aws_subnet" "alexis_subnetA" {
  vpc_id = aws_vpc.alexis_vpc.id
  cidr_block = "12.1.1.0/24"
  availability_zone_id = "euw1-az1"
tags = {
  Name = var.subnet_name_A
  }
}


resource "aws_subnet" "alexis_subnetB" {
  vpc_id = aws_vpc.alexis_vpc.id
  cidr_block = "12.1.2.0/24"
  availability_zone_id = "euw1-az2"
tags = {
  Name = var.subnet_name_B
  }
}

resource "aws_subnet" "alexis_subnetC" {
  vpc_id = aws_vpc.alexis_vpc.id
  cidr_block = "12.1.3.0/24"
  availability_zone_id = "euw1-az3"
tags = {
  Name = var.subnet_name_C
  }
}

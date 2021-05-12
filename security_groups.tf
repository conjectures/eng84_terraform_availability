

resource "aws_security_group" "alexis_sg_public"{
  name = var.security_group_name_public
  description =  "public security group"
  vpc_id = aws_vpc.alexis_vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"   # allow all
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = var.security_group_name_public
  }
}


resource "aws_security_group" "alexis_sg_private"{
  name = var.security_group_name_private
  description =  "private security group"
  vpc_id = aws_vpc.alexis_vpc.id

  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["12.1.0.0/16"] 
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"   # allow all
    cidr_blocks = ["0.0.0.0/0"] 
  }
  tags = {
    Name = var.security_group_name_private
  }
}

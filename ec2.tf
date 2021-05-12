
resource "aws_instance" "db_instance" {
  ami = "ami-0d6344f1f522a76d8"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.alexis_subnetA.id
  private_ip = "12.1.1.11"
  vpc_security_group_ids = [
    aws_security_group.alexis_sg_private.id,
  ]
  tags = {
    Name = var.database_name
  }
}


# Block of code for resource
# resource "aws_instance" "app_instance" {
#   # AMI image for server
#   ami = "ami-042af9229265c27d0"
#   # Instance type
#   instance_type = "t2.micro"
#   # public IP
#   associate_public_ip_address = true
#   # Subnet 
#   subnet_id = aws_subnet.alexis_subnetA.id
#   private_ip = "12.1.1.10"
#   # Security Groups
#   vpc_security_group_ids = [
#     aws_security_group.alexis_sg_public.id, 
#   ]
#   # Tags to be passed to instance
#   tags = {
#     Name = var.application_name
#   }
# 
#   provisioner "remote-exec" {
#     inline = [
#       "cd app",
#       "echo \"export DB_HOST=mongodb://12.1.1.11:27017/posts\" >> /home/ubuntu/.bashrc",
#       ". /home/ubuntu/.bashrc",
#       "sudo pm2 kill",
#       "sudo npm install",
#       "nodejs seeds/seed.js",
#       "sudo pm2 start app.js",
#     ]
#     connection {
#       type = "ssh"
#       user = "ubuntu"
#       agent = true
#       host = self.public_ip
#       private_key = file(pathexpand("~/docs/imp/wrk/sparta_global/aws/eng84devops.pem"))
#     }
#   }
# }

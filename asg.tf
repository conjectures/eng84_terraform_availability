
resource "aws_launch_template" "alexis_lt" {
  name= "eng84_alexis_lt"
  description = "template for web application"
  image_id = "ami-042af9229265c27d0"
  instance_type = "t2.micro"
  key_name = "eng84devops"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination = true
    security_groups = [aws_security_group.alexis_sg_public.id]
  }
  user_data = filebase64("${path.module}/provision.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "eng84_alexis_asg_test"

    }
  }
}

resource "aws_lb" "alexis_alb" {
  name = "eng84-alexis-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alexis_sg_public.id]
  subnets = [
              aws_subnet.alexis_subnetA.id,
              aws_subnet.alexis_subnetB.id,
              aws_subnet.alexis_subnetC.id,
             ]
  tags = {
    Name = "eng84_alexis_ALB"
  }
}



resource "aws_lb_target_group" "alexis_lb_target_group" {
  name = "eng84-alexies-lb-tg"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = aws_vpc.alexis_vpc.id
}

resource "aws_lb_listener" "alexis_lb_listener" {
  load_balancer_arn = aws_lb.alexis_alb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alexis_lb_target_group.arn
  }
}


resource "aws_autoscaling_group" "alexis_asg" {
  name = "eng84_alexis_terraform_asg" 
  max_size = 6
  min_size = 1
  health_check_grace_period = 60
  desired_capacity = 2
  health_check_type = "ELB"
  force_delete = true
  # launch_configuration
  vpc_zone_identifier = [
                            aws_subnet.alexis_subnetA.id,
                            aws_subnet.alexis_subnetB.id,
                            aws_subnet.alexis_subnetC.id,
                        ]
  target_group_arns = [aws_lb_target_group.alexis_lb_target_group.arn]

  
  launch_template {
    id = aws_launch_template.alexis_lt.id
    version = "$Latest"
  }

}

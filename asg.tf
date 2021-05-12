
resource "aws_launch_template" "alexis_lt" {
  name_prefix = "eng84_alexis_auto"
  image_id = "ami-042af9229265c27d0"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "alexis_asg" {
  name = "eng84_alexis_terraform_asg" 
  max_size = 6
  min_size = 1
  health_check_grace_period = 60
  desired_capacity = 2
  health_check_type = "ELB"
  force_delete = true
  placement_group
  # launch_configuration
  vpc_zone_identifier = [
                            aws_subnet.alexis_subnetA,
                            aws_subnet.alexis_subnetB,
                            aws_subnet.alexis_subnetC,
                        ]

  
  launch_template {
    id = aws_launch_template.alexis_lt.id
    version = "$latest"
  }

}

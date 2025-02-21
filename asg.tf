
resource "aws_launch_template" "ecs_launch_template" {
  name_prefix   = "ecs-launch-template"
  image_id      = "ami-0672fd5b9210aa093"
  instance_type = "t3.medium"
  
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 25
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ECS-Instance"
    }
  }
}


resource "aws_autoscaling_group" "primary_ecs_asg" {
  launch_configuration = aws_launch_template.ecs_launch_template.id
  vpc_zone_identifier  = var.subnet_ids
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
}

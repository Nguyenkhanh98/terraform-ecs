
resource "aws_launch_template" "ecs_launch_template" {
  name                = "primary-ecs-asg"
  image_id      = "ami-0672fd5b9210aa093"
  instance_type = "t3.micro"
  
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 25
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "primary-ecs-instance"
    }
  }
}


resource "aws_autoscaling_group" "primary_ecs_asg" {
  vpc_zone_identifier  = var.subnet_ids
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2

  launch_template {
    id      = aws_launch_template.ecs_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "primary-ecs-instance"
    propagate_at_launch = true
  }
}

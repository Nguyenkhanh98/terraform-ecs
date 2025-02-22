data "aws_launch_template" "ecs_launch_template" {
  id = aws_launch_template.ecs_launch_template.id
}

resource "aws_launch_template" "ecs_launch_template" {
  name          = "primary-ecs-asg"
  image_id      = "ami-07c2124e08654f931"
  instance_type = "t3.medium"

   key_name      =     "sysops"
iam_instance_profile {
    name = aws_iam_instance_profile.ecs_instance_profile.name
  }
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 50
    }
  }
  

  user_data = base64encode(<<EOF
#!/bin/bash
echo "ECS_CLUSTER=${aws_ecs_cluster.primary_cluster.name}" >> /etc/ecs/ecs.config
echo "ECS_BACKEND_HOST=" >> /etc/ecs/ecs.config
sudo systemctl enable --now ecs.service
cat /etc/ecs/ecs.config
sudo systemctl restart ecs

EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "primary-ecs-instance"
    }
  }

    network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ecs_sg.id]
  }
}

resource "aws_autoscaling_group" "primary_ecs_asg" {
  name = "primary-ecs"
  vpc_zone_identifier = var.subnet_ids
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2

  launch_template {
   id      = aws_launch_template.ecs_launch_template.id
    version = data.aws_launch_template.ecs_launch_template.latest_version
  }
  tag {
    key                 = "aws:ecs:cluster"
    value               = aws_ecs_cluster.primary_cluster.name
    propagate_at_launch = true
  }

   tag {
    key                 = "Name"
    value               = "primary-ecs-instance"
    propagate_at_launch = true
  }
  protect_from_scale_in = true
}


resource "aws_launch_configuration" "ecs_launch_config" {
  name            = "ecs-launch-config"
  image_id        = "ami-0672fd5b9210aa093"
  instance_type   = "t3.medium"
  security_groups = [aws_security_group.ecs_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name

  user_data = <<-EOF
              #!/bin/bash
              echo "ECS_CLUSTER=${var.ecs_cluster_name}" >> /etc/ecs/ecs.config
              echo "ECS_ENABLE_CONTAINER_METADATA=true" >> /etc/ecs/ecs.config
              yum install -y aws-cli
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "primary_ecs_asg" {
  launch_configuration = aws_launch_configuration.ecs_launch_config.id
  vpc_zone_identifier  = var.subnet_ids
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
}

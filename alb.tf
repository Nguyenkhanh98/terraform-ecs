resource "aws_lb" "onair_alb" {
  name               = "primary-alb"
  internal           = false  # Set to true if it's internal
  load_balancer_type = "application"
  security_groups    = ["aws_security_group.ecs_sg.id"]
  subnets           = var.subnet_ids
}

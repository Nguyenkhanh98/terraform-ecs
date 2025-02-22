resource "aws_lb_target_group" "onair_fe_tg" {
  name     = "onair-fe-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "onair_admin_tg" {
  name     = "onair-admin-tg"
  port     = 3003
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "onair_host_tg" {
  name     = "onair-host-tg"
  port     = 3001
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "onair_api_tg" {
  name     = "onair-api-tg"
  port     = 3005
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "cms_tg" {
  name     = "cms-tg"
  port     = 1338
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

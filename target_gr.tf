resource "aws_lb_target_group" "onair_fe_tg" {
  name        = "onair-fe-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group" "onair_admin_tg" {
  name        = "onair-admin-tg"
  port        = 3003
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"


  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group" "onair_host_tg" {
  name        = "onair-host-tg"
  port        = 3001
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"


  health_check {
    path                = "/host/api/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group" "onair_api_tg" {
  name        = "onair-api-tg"
  port        = 3005
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"


  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group" "onair_cms_tg" {
  name        = "cms-tg"
  port        = 1338
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"


  health_check {
    path                = "/admin"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

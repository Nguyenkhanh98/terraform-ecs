# resource "aws_lb_listener" "onair_http_listener" {
#   load_balancer_arn = aws_lb.onair_alb.arn
#   port              = 80
#   protocol          = "HTTP"
  
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Not Found"
#       status_code  = "404"
#     }
#   }
# }
resource "aws_lb_listener" "onair_https_listener" {
  load_balancer_arn = aws_lb.onair_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:497082176439:certificate/0809d984-62d9-429e-979a-9ffa68a05e4"  # Use your actual ARN

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener" "onair_http_redirect" {
  load_balancer_arn = aws_lb.onair_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}



resource "aws_lb_listener_rule" "onair_fe_rule" {
  listener_arn = aws_lb_listener.onair_http_listener.arn
  priority     = 1


  condition {
    host_header {
      values = ["onair.today"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_fe_tg.arn
  }
}
resource "aws_lb_listener_rule" "onair_fe_https_rule" {
  listener_arn = aws_lb_listener.onair_https_listener.arn
  priority     = 1


  condition {
    host_header {
      values = ["onair.today"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_fe_tg.arn
  }
}

resource "aws_lb_listener_rule" "onair_host_rule" {
  listener_arn = aws_lb_listener.onair_http_listener.arn
  priority     = 30

  condition {
     host_header {
      values = ["host.onair.today"]
    }
  }

  action{
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_host_tg.arn
  }
}

resource "aws_lb_listener_rule" "onair_host_https_rule" {
  listener_arn = aws_lb_listener.onair_https_listener.arn
  priority     = 30

  condition {
     host_header {
      values = ["host.onair.today"]
    }
  }

  action{
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_host_tg.arn
  }
}

resource "aws_lb_listener_rule" "onair_admin_rule" {
  listener_arn = aws_lb_listener.onair_http_listener.arn
  priority     = 2

  condition {
    host_header {
      values = ["admin.onair.today"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_admin_tg.arn
  }
}

resource "aws_lb_listener_rule" "onair_admin_https_rule" {
  listener_arn = aws_lb_listener.onair_https_listener.arn
  priority     = 2

  condition {
    host_header {
      values = ["admin.onair.today"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_admin_tg.arn
  }
}

resource "aws_lb_listener_rule" "onair_api_rule" {
  listener_arn = aws_lb_listener.onair_http_listener.arn
  priority     = 4

  condition {
    host_header {
      values = ["api.onair.today"]
    }
  }

  action{
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_api_tg.arn
  }
}

resource "aws_lb_listener_rule" "onair_api_https_rule" {
  listener_arn = aws_lb_listener.onair_https_listener.arn
  priority     = 4

  condition {
    host_header {
      values = ["api.onair.today"]
    }
  }

  action{
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_api_tg.arn
  }
}

resource "aws_lb_listener_rule" "cms_rule" {
  listener_arn = aws_lb_listener.onair_http_listener.arn
  priority     = 5

  condition {
    host_header {
      values = ["cms.onair.today"]
    }
  }

  action{
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_cms_tg.arn
  }
}

resource "aws_lb_listener_rule" "cms_https_rule" {
  listener_arn = aws_lb_listener.onair_https_listener.arn
  priority     = 5

  condition {
    host_header {
      values = ["cms.onair.today"]
    }
  }

  action{
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_cms_tg.arn
  }
}

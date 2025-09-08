# resource "aws_lb_listener_rule" "onair_ld_https_rule" {
#   listener_arn = aws_lb_listener.onair_ld_https_listener.arn
#   priority     = 30

#   condition {
#     host_header {
#       values = ["ldvietnam.com"]
#     }
#   }

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.onair_ld_tg.arn
#   }
# }

# resource "aws_lb_listener" "onair_ld_https_listener" {
#   load_balancer_arn = aws_lb.onair_ld_alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = "arn:aws:acm:us-east-1:497082176439:certificate/f40bfb38-7228-4877-adf3-87ac9c75c9c4"

#   default_action {
#     type = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Not Found"
#       status_code  = "404"
#     }
#   }
# }
# resource "aws_lb_listener" "onair_http_redirect" {
#   load_balancer_arn = aws_lb.onair_ld_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"
#     redirect {
#       protocol    = "HTTPS"
#       port        = "443"
#       status_code = "HTTP_301"
#     }
#   }
# }

resource "aws_lb_listener" "onair_http_listener" {
  load_balancer_arn = aws_lb.onair_ld_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}


resource "aws_lb_target_group" "onair_ld_tg" {
  name        = "ld-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}


resource "aws_lb_listener_rule" "onair_ld_http_rule" {
  listener_arn = aws_lb_listener.onair_http_listener.arn
  priority     = 30

  condition {
    host_header {
      values = ["ldvietnam.com"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.onair_ld_tg.arn
  }
}
# resource "aws_lb" "nlb" {
#   name               = var.nlb
#   internal           = false
#   load_balancer_type = "network"
#   subnets            = var.subnet_ids
# }

# resource "aws_lb_listener" "nlb_listener" {
#   load_balancer_arn = aws_lb.nlb.arn
#   protocol          = "TCP"
#   port              = 80

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.onair_fe_tg.arn
#   }
# }

# resource "aws_lb_listener_rule" "onair_fe_rule" {
#   listener_arn = aws_lb_listener.nlb_listener.arn
#   priority     = 10

#   condition {
#     host_header {
#       values = ["onair.today"]
#     }
#   }

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.onair_fe_tg.arn
#   }
# }


# resource "aws_lb_listener_rule" "onair_admin_rule" {
#   listener_arn = aws_lb_listener.nlb_listener.arn
#   priority     = 20

#   condition {
#     host_header {
#       values = ["admin.onair.today"]
#     }
#   }
#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.onair_admin_tg.arn
#   }
# }


# resource "aws_lb_listener" "nlb_listener_api" {
#   load_balancer_arn = aws_lb.nlb.arn
#   protocol          = "TCP"
#   port              = 3005

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.onair_api_tg.arn
#   }
# }

# resource "aws_lb_listener" "nlb_listener_cms" {
#   load_balancer_arn = aws_lb.nlb.arn
#   protocol          = "TCP"
#   port              = 1338

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.cms_tg.arn
#   }
# }

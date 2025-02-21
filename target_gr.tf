resource "aws_lb_target_group" "onair_fe_tg" {
  name        = "onair-fe-tg"
  port        = 3000
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group" "onair_admin_tg" {
  name        = "onair-admin-tg"
  port        = 3003
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group" "onair_host_tg" {
  name        = "onair-host-tg"
  port        = 3001
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group" "onair_api_tg" {
  name        = "onair-api-tg"
  port        = 3005
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group" "cms_tg" {
  name        = "cms-tg"
  port        = 1338
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}


resource "aws_lb_target_group_attachment" "onair_fe_attach" {
  target_group_arn = aws_lb_target_group.onair_fe_tg.arn
  target_id        = aws_ecs_service.onair_fe_service.id
  port             = 3000
}

resource "aws_lb_target_group_attachment" "onair_admin_attach" {
  target_group_arn = aws_lb_target_group.onair_admin_tg.arn
  target_id        = aws_ecs_service.onair_admin_service.id
  port             = 3003
}


resource "aws_lb_target_group_attachment" "onair_api_attach" {
  target_group_arn = aws_lb_target_group.onair_api_tg.arn
  target_id        = aws_ecs_service.onair_api_service.id
  port             = 3005
}

resource "aws_lb_target_group_attachment" "cms_attach" {
  target_group_arn = aws_lb_target_group.cms_tg.arn
  target_id        = aws_ecs_service.cms_service.id
  port             = 1338
}

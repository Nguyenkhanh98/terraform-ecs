resource "aws_lb" "onair_ld_alb" {
  name               = "ld-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.subnet_ids
   idle_timeout       = 300 
   
}

resource "aws_lb" "onair_ld_alb" {
  name               = "ld-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_ld_sg.id]
  subnets            = var.subnet_ids
   idle_timeout       = 300 
   
}

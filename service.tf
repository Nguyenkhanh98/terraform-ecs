# ECS Service for Next.js Frontend
resource "aws_ecs_service" "onair_fe_service" {
  name            = "onair_fe-service"
  cluster         = aws_ecs_cluster.primary_cluster.id
  task_definition = aws_ecs_task_definition.onair_fe.arn
  desired_count   = 2
  launch_type     = "EC2"
}

# ECS Service for Admin Panel
resource "aws_ecs_service" "onair_admin_service" {
  name            = "onair_admin-service"
  cluster         = aws_ecs_cluster.primary_cluster.id
  task_definition = aws_ecs_task_definition.onair_admin.arn
  desired_count   = 2
  launch_type     = "EC2"
}

# ECS Service for Host Panel
resource "aws_ecs_service" "onair_host_service" {
  name            = "onair_host-service"
  cluster         = aws_ecs_cluster.primary_cluster.id
  task_definition = aws_ecs_task_definition.onair_host.arn
  desired_count   = 2
  launch_type     = "EC2"
}

# ECS Service for API
resource "aws_ecs_service" "onair_api_service" {
  name            = "onair_api-service"
  cluster         = aws_ecs_cluster.primary_cluster.id
  task_definition = aws_ecs_task_definition.onair-api.arn
  desired_count   = 2
  launch_type     = "EC2"
}

# ECS Service for Strapi CMS
resource "aws_ecs_service" "cms_service" {
  name            = "cms-service"
  cluster         = aws_ecs_cluster.primary_cluster.id
  task_definition = aws_ecs_task_definition.cms.arn
  desired_count   = 2
  launch_type     = "EC2"
}

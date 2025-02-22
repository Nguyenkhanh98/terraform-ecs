resource "aws_ecs_cluster" "primary_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_capacity_provider" "primary_capacity_provider" {
  name = "primary-provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.primary_ecs_asg.arn
    managed_scaling {
      status          = "ENABLED"
      target_capacity = 100
    }
    managed_termination_protection = "ENABLED"
  }
  
}

resource "aws_ecs_cluster_capacity_providers" "primary" {
  cluster_name = aws_ecs_cluster.primary_cluster.name

  capacity_providers = [aws_ecs_capacity_provider.primary_capacity_provider.name]
}

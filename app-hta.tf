# Auto Scaling Target for ECS Services
resource "aws_appautoscaling_target" "onair_fe_scaling_target" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.primary_cluster.id}/${aws_ecs_service.onair_fe_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 2
  max_capacity       = 4
}

resource "aws_appautoscaling_target" "onair_admin_scaling_target" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.primary_cluster.id}/${aws_ecs_service.onair_admin_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 2
  max_capacity       = 4
}

resource "aws_appautoscaling_target" "onair_host_scaling_target" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.primary_cluster.id}/${aws_ecs_service.onair_host_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 2
  max_capacity       = 4
}

resource "aws_appautoscaling_target" "cms_scaling_target" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.primary_cluster.id}/${aws_ecs_service.cms_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 2
  max_capacity       = 4
}

# Scaling Policies (CPU-Based Auto Scaling)
resource "aws_appautoscaling_policy" "onair_fe_scale_up" {
  name               = "onair_fe-scale-up"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.onair_fe_scaling_target.resource_id
  scalable_dimension = "ecs:service:DesiredCount"
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = 90.0  # Scale up when CPU usage reaches 90%
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 300   # Wait 5 minutes before scaling in
    scale_out_cooldown = 60    # Wait 1 minute before scaling out
  }
}

resource "aws_appautoscaling_policy" "onair_admin_scale_up" {
  name               = "onair_admin-scale-up"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.onair_admin_scaling_target.resource_id
  scalable_dimension = "ecs:service:DesiredCount"
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = 90.0
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 300
    scale_out_cooldown = 60
  }
}

resource "aws_appautoscaling_policy" "onair_host_scale_up" {
  name               = "onair_host-scale-up"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.onair_host_scaling_target.resource_id
  scalable_dimension = "ecs:service:DesiredCount"
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = 90.0
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 300
    scale_out_cooldown = 60
  }
}

resource "aws_appautoscaling_policy" "cms_scale_up" {
  name               = "cms-scale-up"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.cms_scaling_target.resource_id
  scalable_dimension = "ecs:service:DesiredCount"
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = 90.0
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 300
    scale_out_cooldown = 60
  }
}

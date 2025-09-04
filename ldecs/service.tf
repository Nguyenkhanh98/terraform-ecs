resource "aws_ecs_service" "onair_ld_service" {
  name                               = "onair_ld-service"
  cluster                            = var.ecs_cluster_name
  task_definition                    = aws_ecs_task_definition.onair_ld.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  capacity_provider_strategy {
    capacity_provider = "public-provider"
    weight            = 1
  }
    placement_constraints {
    type       = "distinctInstance"
  }

  

    capacity_provider_strategy {
    capacity_provider = "public-provider"
    weight            = 1
  }


  load_balancer {
    target_group_arn = aws_lb_target_group.onair_ld_tg.arn
    container_name   = "onair_ld-container"
    container_port   = 3000
  }
}
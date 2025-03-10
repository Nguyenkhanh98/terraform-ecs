# Task Definition for Next.js
resource "aws_ecs_task_definition" "onair_fe" {
  family                   = "onair_fe-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name      = "onair_fe-container"
      image     = "onairtoday/onair:${var.image_tag_fe}"
      memory    = 512
      cpu       = 256
      essential = true
      environment = [
        for key, value in var.fe_variables : {
          name  = key
          value = value
        }
      ]
      portMappings = [{ containerPort = 3000 ,
        hostPort = 3000
      }]
      command      = ["yarn", "workspace", "web", "server"]
      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
       logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/onair"
          awslogs-region        = "ap-southeast-1"
          awslogs-stream-prefix = "onair_fe"
        }
      }
    }
  ])
}

resource "aws_ecs_task_definition" "onair_admin" {
  family                   = "onair_admin-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "onair_admin-container"
      image     = "onairtoday/onair:${var.image_tag_admin}"
      memory    = 512
      cpu       = 256
      essential = true
      environment = [
        for key, value in var.admin_variables : {
          name  = key
          value = value
        }
      ]
      portMappings = [{ containerPort = 3003,
      
        hostPort = 3003
      }]
      command      = ["yarn", "workspace", "admin", "server"]
      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/onair"
          awslogs-region        = "ap-southeast-1"
          awslogs-stream-prefix = "onair_admin"
        }
      }
    }
  ])
}

resource "aws_ecs_task_definition" "onair_host" {
  family                   = "onair_host-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "onair_host-container"
      image     = "onairtoday/onair:${var.image_tag_host}"
      memory    = 512
      cpu       = 256
      essential = true
      environment = [
        for key, value in var.host_variables : {
          name  = key
          value = value
        }
      ]
      portMappings = [{ containerPort = 3001,
        hostPort = 3001
       }]
      command      = ["yarn", "workspace", "host", "server"]
      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/onair"
          awslogs-region        = "ap-southeast-1"
          awslogs-stream-prefix = "onair_host"
        }
      }
    }
  ])
}

resource "aws_ecs_task_definition" "onair-api" {
  family                   = "onair-api-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "1024"
  cpu                      = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "onair-api-container"
      image     = "onairtoday/onair:${var.image_tag_api}"
      memory    = 1024
      cpu       = 512
      essential = true
      environment = [
        for key, value in var.api_variables : {
          name  = key
          value = value
        }
      ]
      portMappings = [{ containerPort = 3005,
        hostPort = 3005
       }]

      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }

       logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/onair"
          awslogs-region        = "ap-southeast-1"
          awslogs-stream-prefix = "onair_api"
        }
      }
    }
  ])
}

# Task Definition for Strapi
resource "aws_ecs_task_definition" "cms" {
  family                   = "cms-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn


  container_definitions = jsonencode([
    {
      name      = "cms-container"
      image     = "onairtoday/onair:${var.image_tag_cms}"
      memory    = 512
      cpu       = 256
      essential = true
      environment = [
        for key, value in var.cms_variables : {
          name  = key
          value = value
        }
      ]
      portMappings = [{ containerPort = 1338
        hostPort = 1338
      }]

      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
       logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/onair"
          awslogs-region        = "ap-southeast-1"
          awslogs-stream-prefix = "cms"
        }
      }
    }
  ])
}

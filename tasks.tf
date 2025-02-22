# Task Definition for Next.js
resource "aws_ecs_task_definition" "onair_fe" {
  family                   = "onair_fe-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name         = "onair_fe-container"
      image        = "onairtoday/onair:web-latest"
      memory       = 512
      cpu          = 256
      essential    = true
      portMappings = [{ containerPort = 3000 }]

      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
    }
  ])
}

resource "aws_ecs_task_definition" "onair_admin" {
  family                   = "onair_fe-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name         = "onair_admin-container"
      image        = "onairtoday/onair:admin-latest"
      memory       = 512
      cpu          = 256
      essential    = true
      portMappings = [{ containerPort = 3003 }]

        repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
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

  container_definitions = jsonencode([
    {
      name         = "onair_host-container"
      image        = "onairtoday/onair:host-latest"
      memory       = 512
      cpu          = 256
      essential    = true
      portMappings = [{ containerPort = 3001 }]

        repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
    }
  ])
}

resource "aws_ecs_task_definition" "onair-api" {
  family                   = "onair-api-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name         = "onair-api-container"
      image        = "onairtoday/onair:main-api-latest"
      memory       = 512
      cpu          = 256
      essential    = true
      portMappings = [{ containerPort = 3005 }]

        repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
    }
  ])
}

# Task Definition for Strapi
resource "aws_ecs_task_definition" "cms" {
  family                   = "cms-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "1024"
  cpu                      = "512"

  container_definitions = jsonencode([
    {
      name         = "cms-container"
      image        = "onairtoday/onair:master-cms-latest"
      memory       = 1024
      cpu          = 512
      essential    = true
      portMappings = [{ containerPort = 1338 }]

        repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
    }
  ])
}

# Task Definition for Next.js
resource "aws_ecs_task_definition" "onair_ld" {
  family                   = "onair_ld-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  memory                   = "800"
  cpu                      = "350"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name      = "onair_ld-container"
      image     = "onairtoday/onair:${var.image_tag_ld}"
      memory    = 800
      cpu       = 350
      essential = true
      environment = [
        for key, value in var.ld_variables : {
          name  = key
          value = value
        }
      ]
      portMappings = [{ containerPort = 3000 
      }]
      command      = ["yarn", "workspace", "ld", "server"]
      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:ap-southeast-1:497082176439:secret:private-docker-credentials-27MkrS"
      }
    }
  ])
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskLDExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_secrets_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

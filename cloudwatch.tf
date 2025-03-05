resource "aws_cloudwatch_log_group" "onair_logs" {
  name              = "/ecs/onair"
  retention_in_days = 30
}
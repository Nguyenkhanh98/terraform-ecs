resource "aws_ecs_cluster" "primary_cluster" {
  name = var.ecs_cluster_name
}

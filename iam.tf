# Check if the IAM role already exists
data "aws_iam_role" "existing_role" {
  name = "ecsInstanceRole"
}

# Create the IAM Role only if it doesn't exist
resource "aws_iam_role" "ecs_instance_role" {
  count = length(data.aws_iam_role.existing_role) > 0 ? 0 : 1

  name = "ecsInstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Dynamically select the IAM Role Name
locals {
  iam_role_name = length(data.aws_iam_role.existing_role) > 0 ? data.aws_iam_role.existing_role.name : aws_iam_role.ecs_instance_role[0].name
}

# Create an instance profile for the role
resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecsInstanceProfile"
  role = local.iam_role_name
}

# Attach the necessary policy to the IAM role
resource "aws_iam_role_policy_attachment" "ecs_instance_policy" {
  role       = local.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

variable "image_tag_ld" {
  description = "The image tag for the onair_ld container"
  type        = string
}

variable "ld_variables" {
  description = "Environment variables for the onair_ld container"
  type        = map(string)
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "https_listener_arn" {
  description = "The ARN of the HTTPS listener"
  type        = string
}

variable "alb_sg_id" {
    description = "The security group ID for the ALB"
    type        = string
    default     = ""
}
variable "subnet_ids" {
    description = "The subnet IDs for the ALB"
    type        = list(string)
    default     = []
}   


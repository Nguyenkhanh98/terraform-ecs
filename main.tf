

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "primary-cluster"
}

variable "nlb" {
  description = "Name of the Network Load Balancer"
  type        = string
  default     = "primary-nlb"
}

variable "onairdomain" {
  description = "Domain for onair"
  type        = string
  default     = "onair.today"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "sad"

}

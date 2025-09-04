


variable "image_tag_cms" {
  description = "The latest image tag for cms"
  type        = string
  default     = "master-cms-latest"
}
variable "image_tag_fe" {
  description = "The latest image tag for fe"
  type        = string
  default     = "web-latest"

}

variable "image_tag_host" {
  description = "The latest image tag for host"
  type        = string
  default     = "host-latest"
}

variable "image_tag_admin" {
  description = "The latest image tag for admin"
  type        = string
  default     = "admin-latest"
}

variable "image_tag_api" {
  description = "The latest image tag for api"
  type        = string
  default     = "main-api-latest"
}


variable "cms_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default = {
  }
}



variable "fe_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default = {
  }
}


variable "api_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default = {
  }
}

variable "admin_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default = {
  }
}

variable "host_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default = {
  }
}




variable "image_tag_cms" {
   description = "The latest image digest for app1"
   type        = string
}
variable "image_tag_fe" {
   description = "The latest image digest for app1"
   type        = string
}

variable "image_tag_host" {
   description = "The latest image digest for app1"
   type        = string
}

variable "image_tag_admin" {
   description = "The latest image digest for app1"
   type        = string
}

variable "image_tag_api" {
   description = "The latest image digest for app1"
   type        = string
}


variable "cms_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default     = {
  }
}



variable "fe_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default     = {
  }
}


variable "api_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default     = {
  }
}

variable "admin_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default     = {
  }
}

variable "host_variables" {
  description = "Environment variables for multiple applications"
  type        = map(string)
  default     = {
  }
}

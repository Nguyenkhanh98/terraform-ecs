

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
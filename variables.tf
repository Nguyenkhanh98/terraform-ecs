

variable "cms_variables" {
  description = "Environment variables for multiple applications"
  type        = map(map(string))
  default     = {
  }
}

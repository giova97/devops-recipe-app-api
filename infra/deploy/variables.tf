variable "prefix" {
  description = "Prefix for resources in AWS"
  type        = string
  default     = "raa"
}

variable "project" {
  description = "Project name for tagging resources"
  type        = string
  default     = "recipe-app-api"
}

variable "contact" {
  description = "Contact email for tagging resources"
  type        = string
  default     = "giorgos.georgiou.dev@gmail.com"
}

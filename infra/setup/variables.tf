variable "tf_state_bucket" {
  description = "Name of s3 bucket in AWS for storing Terraform state"
  type        = string
  default     = "devops-gio"
}
variable "tf_state_lock_table" {
  description = "Name of dynamodb table in AWS for Terraform state locking"
  type        = string
  default     = "devops-recipe-app-api-lock"
}

variable "project" {
  description = "Project name for tagging resources"
  type        = string
  default     = "recipe-app-api"
}

variable "contact" {
  description = "Contact email"
  type        = string
  default     = "giorgos.georgiou.dev@gmail.com"
}

variable "prefix" {
  description = "Prefix for resources"
  type        = string
  default     = "devops"
}

# variables.tf
variable "environment" {
  description = "Deployment environment (e.g., dev, prod, staging)"
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}
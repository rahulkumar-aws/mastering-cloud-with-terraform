variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "The name of the project for consistent resource naming"
  type        = string
  default     = "azure-bigdata-stack"
}
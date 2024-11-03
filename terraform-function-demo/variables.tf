# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"  # Default AWS region
}

# AWS Access Key and Secret Key (optional if using an IAM role or environment variables)
variable "aws_access_key" {
  description = "AWS access key for authentication."
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key for authentication."
  type        = string
  sensitive   = true
}

# Example variables for Google Cloud (GCP)
# variable "gcp_project" {
#   description = "GCP Project ID."
#   type        = string
# }

# variable "gcp_region" {
#   description = "GCP Region to deploy resources in."
#   type        = string
#   default     = "us-central1"
# }

# Example variables for Azure
# variable "azure_subscription_id" {
#   description = "Azure Subscription ID."
#   type        = string
# }

# variable "azure_tenant_id" {
#   description = "Azure Tenant ID."
#   type        = string
# }

# Custom project-wide variables
variable "project_name" {
  description = "The name of the project for tagging and resource naming."
  type        = string
  default     = "mastering-terraform"
}

variable "environment" {
  description = "The environment for deployment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

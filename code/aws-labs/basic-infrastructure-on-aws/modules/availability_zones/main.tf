terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Use the correct version for your setup
    }
  }
}

variable "region" {}

# Query availability zones for the specified region
data "aws_availability_zones" "available" {}

# Output the list of availability zones
output "azs" {
  value = data.aws_availability_zones.available.names
}

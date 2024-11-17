# Reintroduce the provider configuration with the original alias
provider "aws" {
  alias  = "region_provider"
  region = "us-east-1"  # Replace with the original region
}

# Module block to pass the provider configuration dynamically
module "availability_zones" {
  source = "./modules/availability_zones"

  region = "us-east-1"  # Replace with the original region used

  providers = {
    aws = aws.region_provider  # Pass the reintroduced provider configuration
  }
}

# Output to ensure Terraform state is consistent
output "availability_zones" {
  value = module.availability_zones.azs
}

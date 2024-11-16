locals {
  names         = ["dev", "staging", "prod"]
  project_name  = "my-app-123"
  uppercase_str = upper("terraform")
}

output "joined_names" {
  value = join("-", local.names)  # "dev-staging-prod"
}

output "cleaned_name" {
  value = replace(local.project_name, "-123", "")  # "my-app"
}

output "uppercase" {
  value = local.uppercase_str  # "TERRAFORM"
}
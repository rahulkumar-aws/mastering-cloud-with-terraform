locals {
  names         = ["dev", "staging", "prod"]
  project_name  = "my-app-123"
  uppercase_str = upper("terraform")
}

output "joined_names" {
  value = join("-", local.names)  # Expected output: "dev-staging-prod"
}

output "cleaned_name" {
  value = replace(local.project_name, "-123", "")  # Expected output: "my-app"
}

output "uppercase" {
  value = local.uppercase_str  # Expected output: "TERRAFORM"
}

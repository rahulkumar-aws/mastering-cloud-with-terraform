provider "aws" {
  region = "us-east-1"  # Specify the region
}

data "aws_ami" "aws_ami_list" {
  owners = ["amazon"]  # Replace "self" with an owner ID if necessary

  # Optionally, you can add filters to find specific AMIs by name or other criteria
  filter {
    name   = "name"
    values = ["*ubuntu*"]  # Replace with your desired name pattern, e.g., "*ubuntu*"
  }

  most_recent = true  # Optional: Returns the latest AMI if multiple match
}

output "ami_id" {
  value = data.aws_ami.aws_ami_list.id
}

output "ami_name" {
  value = data.aws_ami.aws_ami_list.name
}

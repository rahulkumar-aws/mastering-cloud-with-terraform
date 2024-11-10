provider "aws" {
  region = "us-east-1"
}

data "aws_ami_ids" "ubuntu_images" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-*"]
  }
}

output "top_10_amis" {
  value = slice(
    data.aws_ami_ids.ubuntu_images.ids,
    max(length(data.aws_ami_ids.ubuntu_images.ids) - 10, 0),
    length(data.aws_ami_ids.ubuntu_images.ids)
  )
}

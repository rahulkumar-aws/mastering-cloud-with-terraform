# Using Terraform to Retrieve Official AMIs for Different Operating Systems and Configurations

Amazon Machine Images (AMIs) are essential for deploying instances on AWS, but selecting the right AMI can be challenging given the vast number of options. In this guide, we'll explore how to use Terraform to list and retrieve AMIs for popular operating systems and configurations by leveraging owner IDs and filters. This approach ensures you get trusted, official AMIs that meet your deployment needs.

## Why Use Specific Owner IDs?

Each AMI on AWS is associated with an owner ID, representing the publisher or creator of the image. Major publishers like Amazon, Canonical, Red Hat, and Microsoft release official AMIs, which are updated regularly to include security patches and feature improvements. By targeting specific owner IDs in Terraform, we can confidently use verified AMIs for secure, reliable deployments.

### Common Owner IDs for Popular AMIs

Here are some commonly used owners and the types of AMIs they publish:

- **Amazon** (`amazon`): Amazon Linux, Windows Server, Deep Learning AMIs
- **Canonical** (`099720109477`): Official Ubuntu images
- **Microsoft** (`801119661308`): Windows Server and Visual Studio images
- **Red Hat** (`309956199498`): Red Hat Enterprise Linux (RHEL)
- **SUSE** (`013907871322`): SUSE Linux Enterprise Server (SLES)
- **Debian** (`136693071363`): Official Debian images
- **NVIDIA** (`319692782114`): GPU-optimized Deep Learning AMIs

## Example Terraform Configuration

Using Terraform, we can specify different AMIs by applying filters based on owner IDs and AMI names. Here’s a Terraform configuration that retrieves the latest Amazon Linux, Ubuntu, RHEL, and Windows AMIs from their official publishers.

### Setting Up the Terraform Configuration

Below is an example configuration that queries AMIs for Amazon Linux, Ubuntu, Red Hat, and Windows Server.

```hcl
provider "aws" {
  region = "us-east-1"  # Specify your preferred AWS region
}

# Amazon Linux 2 (Amazon)
data "aws_ami" "amazon_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Ubuntu 20.04 LTS (Canonical)
data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]  # Canonical's AWS account ID for Ubuntu
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# RHEL 8 (Red Hat)
data "aws_ami" "rhel" {
  owners      = ["309956199498"]  # Red Hat's AWS account ID
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-8.*_HVM-*-x86_64*"]
  }
}

# Windows Server 2019 (Microsoft)
data "aws_ami" "windows" {
  owners      = ["801119661308"]  # Microsoft's AWS account ID
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

# Outputs to view the selected AMIs
output "amazon_linux_ami" {
  value = data.aws_ami.amazon_linux.id
}

output "ubuntu_ami" {
  value = data.aws_ami.ubuntu.id
}

output "rhel_ami" {
  value = data.aws_ami.rhel.id
}

output "windows_ami" {
  value = data.aws_ami.windows.id
}
```

### Explanation of the Configuration

- **Amazon Linux 2**: Uses `owners = ["amazon"]` and filters to the latest `amzn2-ami-hvm-*` AMI for Amazon Linux 2.
- **Ubuntu 20.04 LTS**: Uses Canonical’s owner ID (`099720109477`) with a name filter matching `ubuntu-focal-20.04`.
- **RHEL 8**: Uses Red Hat’s owner ID (`309956199498`) and a name filter for `RHEL-8`.
- **Windows Server 2019**: Uses Microsoft’s owner ID (`801119661308`) and a filter for Windows Server 2019.

By setting `most_recent = true`, each `data "aws_ami"` block retrieves the latest version that matches these criteria.

## Additional Customizations

### Retrieve GPU-Optimized Deep Learning AMIs

To list GPU-optimized Deep Learning AMIs published by NVIDIA, use NVIDIA’s owner ID (`319692782114`) with the relevant filters.

```hcl
data "aws_ami" "gpu_optimized" {
  owners      = ["319692782114"]
  most_recent = true

  filter {
    name   = "name"
    values = ["NVIDIA Deep Learning AMI Ubuntu*"]
  }
}

output "gpu_optimized_ami" {
  value = data.aws_ami.gpu_optimized.id
}
```

### Common Troubleshooting Tips

1. **Region-Specific Availability**: Some AMIs may only be available in certain regions. Ensure that the specified region has the AMI by using the `aws ec2 describe-images` command with filters.

2. **Filter Criteria**: Double-check filter values. For example, `"*Ubuntu*"`, `"amzn2-ami-hvm-*"` etc., should match the AMI naming convention. 

3. **Access Permissions**: Some AMIs may require specific permissions or subscriptions, particularly for AMIs in the AWS Marketplace.

## Conclusion

By using Terraform to query AMIs with owner IDs and filters, you gain precise control over which images are deployed, ensuring that they are official, reliable, and updated. This setup not only simplifies infrastructure management but also helps maintain consistency across deployments, especially in multi-team or multi-environment setups.

Using this guide, you can confidently set up Terraform configurations to retrieve official AMIs for various operating systems and configurations on AWS. With the right filters and owner IDs, you can easily adapt this approach to fit your specific infrastructure needs.

--- 

This approach helps maintain security, reliability, and control in AWS deployments, making it a valuable technique for DevOps teams, cloud architects, and anyone managing infrastructure as code on AWS.
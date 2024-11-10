# How to List the Top 10 Latest AWS AMIs with Terraform and the AWS CLI

When working with Terraform to manage AWS infrastructure, you may occasionally need to retrieve a list of the latest Amazon Machine Images (AMIs) to choose from for your deployments. While Terraform can retrieve the **most recent AMI** with its `data "aws_ami"` data source, it doesn’t natively support listing multiple AMIs at once, such as the top 10 latest AMIs. 

In this post, we’ll explore why Terraform can’t directly retrieve multiple AMIs, and then we’ll implement a workaround using the AWS CLI with Terraform’s `local-exec` provisioner to list the top 10 AMIs based on our filters.

## Why Terraform Can’t Retrieve Multiple AMIs by Default

Terraform’s `aws_ami` data source is designed to retrieve only **one AMI at a time**. It lets you specify filters, owners, and other criteria, but it will return only a single result. By default, it pulls the **most recent AMI** that meets the criteria when `most_recent = true` is set.

This limitation can be restrictive if:
1. You need to evaluate several AMIs before making a selection.
2. You want to list the top 10 (or more) latest AMIs for reference or auditing purposes.

To overcome this limitation, we can turn to the **AWS CLI** as a workaround to retrieve multiple AMIs in Terraform.

## The Workaround: Using the AWS CLI with Terraform’s `local-exec` Provisioner

The AWS CLI provides more flexibility than Terraform for listing AMIs, including options for retrieving multiple AMIs sorted by creation date. We’ll use a `local-exec` provisioner in Terraform to execute an AWS CLI command that lists the top 10 latest AMIs based on our filters.

### Step-by-Step Guide to Implement the Workaround

1. **Install the AWS CLI**: Ensure the AWS CLI is installed and configured on the machine running Terraform.

   - To install the AWS CLI:
     ```bash
     # For macOS/Linux
     curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
     unzip awscliv2.zip
     sudo ./aws/install

     # For Windows, follow AWS installation instructions.
     ```

2. **Configure the AWS CLI**: Make sure you have configured your AWS credentials. You can do this by running:
   ```bash
   aws configure
   ```

3. **Write the AWS CLI Command**: Here’s the AWS CLI command to list the top 10 latest AMIs that meet our specified filters. This example lists Amazon Linux 2 AMIs owned by AWS:

   ```bash
   aws ec2 describe-images \
       --owners amazon \
       --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
       --query "Images | sort_by(@, &CreationDate)[-10:].[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}" \
       --output table
   ```

   - **`--owners amazon`**: Filters AMIs owned by AWS.
   - **`--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2"`**: Filters Amazon Linux 2 AMIs.
   - **`--query`**: Uses JMESPath syntax to sort the AMIs by `CreationDate` and retrieve the top 10.
   - **`--output table`**: Outputs the results in a table format.

4. **Embed the Command in Terraform Using `local-exec`**: Use Terraform’s `local-exec` provisioner to run this AWS CLI command during the apply phase.

### Full Terraform Configuration Example

The following Terraform configuration includes a `null_resource` with a `local-exec` provisioner to run the AWS CLI command. When you apply this configuration, it will list the top 10 latest AMIs that match the filters specified in the CLI command.

```hcl
provider "aws" {
  region = "us-east-1"
}

# Null resource with local-exec provisioner to run AWS CLI command
resource "null_resource" "list_top_10_amis" {
  provisioner "local-exec" {
    command = <<EOT
      aws ec2 describe-images \
      --owners amazon \
      --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
      --query "Images | sort_by(@, &CreationDate)[-10:].[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}" \
      --output table
    EOT
  }
}
```

### Explanation of the Configuration

- **`provider "aws"`**: Configures the AWS provider. Set the region as needed.
- **`null_resource` with `local-exec`**: The `null_resource` triggers a `local-exec` provisioner that executes the AWS CLI command.
- **Command Execution**: The AWS CLI command runs on the local machine where Terraform is executed, and it outputs the top 10 latest AMIs in a readable table format.

### Running the Configuration

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Apply the Configuration:
   ```bash
   terraform apply
   ```

The `terraform apply` command will execute the AWS CLI command, listing the top 10 latest AMIs that match the filters.

### Output Example

The command output will look like this:

```
---------------------
|   DescribeImages   |
---------------------
|     ID      |       Name                           | CreationDate             |
---------------------
| ami-1234abcd | amzn2-ami-hvm-2.0.20210912.0-x86_64 | 2021-09-12T12:00:00.000Z |
| ami-5678efgh | amzn2-ami-hvm-2.0.20210808.0-x86_64 | 2021-08-08T12:00:00.000Z |
| ...          | ...                                 | ...
```

### Key Considerations

- **AWS CLI Permissions**: Ensure the AWS CLI is configured with an IAM role or user that has `ec2:DescribeImages` permissions.
- **Local Execution**: This command runs locally, so the AWS CLI must be installed and configured on the same machine where you’re running Terraform.
- **Maintenance**: If you’re retrieving AMIs regularly, consider automating this setup in a CI/CD pipeline where the AWS CLI is pre-installed.

## Summary

Terraform’s `aws_ami` data source doesn’t support retrieving multiple AMIs directly, so to retrieve the top 10 latest AMIs, we used a `local-exec` provisioner with an AWS CLI command. This approach enables you to evaluate or audit multiple AMIs before selecting one for deployment.

By following this guide, you can easily retrieve a list of AMIs that match your specific criteria. This workaround is a valuable technique for teams that want more control over the AMIs they deploy, especially when working with dynamic environments and frequent AMI updates.

Using the AWS CLI with Terraform provides the flexibility needed for tasks that Terraform alone doesn’t natively support. Happy deploying!
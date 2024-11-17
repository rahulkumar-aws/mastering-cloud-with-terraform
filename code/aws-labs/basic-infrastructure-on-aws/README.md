### Manula Steps: If want to test and see UI interface
1. Create a VPC in your account in the given region e.g: us-east-1
2. Create public and private subnets in all available Availability Zones.
3. Deploy am Internet Gateway and attach it to the VPC.
4. Provision a NAT Gateway (a Single instance will do) for all outbound connectivity.
5. Ensure the route tables are configured to properly route traffic based on the requirements.
6. Delete the VPC resources

### Using Terraform
7. Prepare files and credentials for using Terraform to deploy cloud resources
8. Set credentials for Terraform deployment
9. Deploy the AWS infrastructure using Terraform
10. Delete the AWS resources using Terraform to clean up our AWS environment
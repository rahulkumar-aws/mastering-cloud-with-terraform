A multi-cloud Terraform codebase typically involves a structure that separates core infrastructure (e.g., networking, storage) from data-related resources (e.g., databases, data warehouses). Here’s an example of a multi-cloud codebase organized for both core and data-related resources, including AWS, Azure, and Google Cloud.

### Folder Structure

```plaintext
multi-cloud-terraform/
├── aws/
│   ├── core/
│   │   ├── vpc.tf
│   │   ├── security_groups.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── variables.tf
│   ├── data/
│   │   ├── rds.tf
│   │   ├── s3.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── variables.tf
├── azure/
│   ├── core/
│   │   ├── network.tf
│   │   ├── security_groups.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── variables.tf
│   ├── data/
│   │   ├── cosmosdb.tf
│   │   ├── blob_storage.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── variables.tf
├── gcp/
│   ├── core/
│   │   ├── vpc.tf
│   │   ├── firewall_rules.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── variables.tf
│   ├── data/
│   │   ├── bigquery.tf
│   │   ├── gcs.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── variables.tf
└── main.tf
```

### Core Components

Each cloud provider’s core infrastructure setup includes networking, security groups, and other foundational resources.

#### AWS Core (`aws/core/`)

`vpc.tf`
```hcl
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}
```

#### Azure Core (`azure/core/`)

`network.tf`
```hcl
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}
```

#### GCP Core (`gcp/core/`)

`vpc.tf`
```hcl
resource "google_compute_network" "vpc" {
  name                    = "vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.subnet_cidr
}
```

### Data Components

Each cloud provider’s data setup includes resources like databases and object storage.

#### AWS Data (`aws/data/`)

`rds.tf`
```hcl
resource "aws_db_instance" "db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql8.0"
}
```

`s3.tf`
```hcl
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
```

#### Azure Data (`azure/data/`)

`cosmosdb.tf`
```hcl
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "cosmosdb-account"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"
}
```

#### GCP Data (`gcp/data/`)

`bigquery.tf`
```hcl
resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_id
  location   = var.location
}
```

`gcs.tf`
```hcl
resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
}
```

### `main.tf`

This file ties together modules or resource files from each cloud provider’s folder.

```hcl
module "aws_core" {
  source = "./aws/core"
}

module "aws_data" {
  source = "./aws/data"
}

module "azure_core" {
  source = "./azure/core"
}

module "azure_data" {
  source = "./azure/data"
}

module "gcp_core" {
  source = "./gcp/core"
}

module "gcp_data" {
  source = "./gcp/data"
}
```

### Variables and Providers

In each provider’s `variables.tf`, define necessary variables (e.g., VPC CIDR, subnet CIDR). Each `providers.tf` file should specify the respective provider and credentials.

For example, in `aws/providers.tf`:

```hcl
provider "aws" {
  region = var.aws_region
}
```

### Usage

To deploy this setup:
1. Set up environment variables or Terraform Cloud for sensitive data.
2. Run `terraform init` and `terraform apply` in each cloud provider folder to deploy core and data resources.

### If we want to have a directory structure w.r.t application servers, data science environments, and other services

To accommodate future needs for application servers, data science environments, and other services, we can organize the Terraform codebase into additional layers. Here’s how to extend the structure to be more modular and scalable:

### Extended Folder Structure

```plaintext
multi-cloud-terraform/
├── aws/
│   ├── core/
│   ├── data/
│   ├── app/
│   │   ├── ec2_instances.tf
│   │   ├── load_balancer.tf
│   │   ├── autoscaling.tf
│   │   └── variables.tf
│   ├── data_science/
│   │   ├── sagemaker.tf
│   │   ├── emr_cluster.tf
│   │   └── variables.tf
├── azure/
│   ├── core/
│   ├── data/
│   ├── app/
│   │   ├── vm.tf
│   │   ├── load_balancer.tf
│   │   └── variables.tf
│   ├── data_science/
│   │   ├── aml_workspace.tf
│   │   ├── databricks_cluster.tf
│   │   └── variables.tf
├── gcp/
│   ├── core/
│   ├── data/
│   ├── app/
│   │   ├── gke_cluster.tf
│   │   ├── instance_group.tf
│   │   └── variables.tf
│   ├── data_science/
│   │   ├── ai_platform.tf
│   │   ├── dataproc_cluster.tf
│   │   └── variables.tf
└── main.tf
```

### Future-Proof Components

Each cloud provider can include an `app` and `data_science` folder. Here’s an example of resources these might contain:

1. **Application Layer (app/):** Infrastructure for web servers, load balancers, and scaling resources.
   - `aws/app/ec2_instances.tf`: Define EC2 instances and autoscaling.
   - `azure/app/vm.tf`: Define virtual machines for Azure with scaling and load balancer configurations.
   - `gcp/app/gke_cluster.tf`: Define GKE clusters or other compute instances for applications.

2. **Data Science Layer (data_science/):** Resources specific to data science workloads.
   - `aws/data_science/sagemaker.tf`: AWS SageMaker configurations for ML model training.
   - `azure/data_science/aml_workspace.tf`: Azure Machine Learning workspace setup.
   - `gcp/data_science/ai_platform.tf`: Google AI Platform or Dataproc cluster for data science tasks.

### Example for AWS Application Layer (app/ec2_instances.tf)

```hcl
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    Name = "AppServer"
  }
}
```

With this structure, adding new resources like a database or a new machine learning service is straightforward. Each new service type would fit into its respective layer, ensuring a modular and scalable setup that aligns with your future requirements.

### If we want some resources in each project

If you need EC2 instances in each stack (core, data, app, data science), you can define them in a modular way, so they are provisioned with specific configurations for each purpose. Here’s an updated structure that includes EC2 in each stack, with separate configuration files and variables for each stack.

### Updated Folder Structure

```plaintext
multi-cloud-terraform/
├── aws/
│   ├── core/
│   │   ├── vpc.tf
│   │   ├── ec2_core.tf
│   │   ├── security_groups.tf
│   │   └── variables.tf
│   ├── data/
│   │   ├── rds.tf
│   │   ├── s3.tf
│   │   ├── ec2_data.tf
│   │   └── variables.tf
│   ├── app/
│   │   ├── ec2_app.tf
│   │   ├── load_balancer.tf
│   │   └── variables.tf
│   ├── data_science/
│   │   ├── sagemaker.tf
│   │   ├── ec2_data_science.tf
│   │   └── variables.tf
└── main.tf
```

### Example EC2 Configuration for Each Stack

Below are examples of how each EC2 instance configuration might look depending on the specific stack:

1. **Core EC2 Instances (ec2_core.tf)**: These could be minimal instances for logging or monitoring.
   ```hcl
   resource "aws_instance" "core_ec2" {
     ami           = var.core_ami_id
     instance_type = var.core_instance_type
     tags = {
       Name = "Core-EC2"
     }
   }
   ```

2. **Data EC2 Instances (ec2_data.tf)**: These might run databases or handle ETL tasks.
   ```hcl
   resource "aws_instance" "data_ec2" {
     ami           = var.data_ami_id
     instance_type = var.data_instance_type
     tags = {
       Name = "Data-EC2"
     }
   }
   ```

3. **App EC2 Instances (ec2_app.tf)**: These are application servers, potentially behind a load balancer.
   ```hcl
   resource "aws_instance" "app_ec2" {
     ami           = var.app_ami_id
     instance_type = var.app_instance_type
     tags = {
       Name = "App-EC2"
     }
   }
   ```

4. **Data Science EC2 Instances (ec2_data_science.tf)**: These could be powerful instances for running machine learning workloads.
   ```hcl
   resource "aws_instance" "data_science_ec2" {
     ami           = var.data_science_ami_id
     instance_type = var.data_science_instance_type
     tags = {
       Name = "DataScience-EC2"
     }
   }
   ```

### Centralized Variables and Main Configuration

Each EC2 configuration can be parameterized through `variables.tf` files in each stack, specifying things like `ami_id` and `instance_type`. For example:

**variables.tf (for Core Stack)**
```hcl
variable "core_ami_id" {
  description = "AMI ID for core EC2 instances"
}

variable "core_instance_type" {
  description = "Instance type for core EC2 instances"
  default     = "t2.micro"
}
```

### `main.tf`

Use the main file to organize and call each module, ensuring each stack has its own EC2 resources as required:

```hcl
module "aws_core" {
  source = "./aws/core"
}

module "aws_data" {
  source = "./aws/data"
}

module "aws_app" {
  source = "./aws/app"
}

module "aws_data_science" {
  source = "./aws/data_science"
}
```

This approach ensures that EC2 instances are available in each stack, each tailored for its specific use case (core, data, app, data science) while maintaining a modular and organized structure.

### Adding Secirity and Firewall 

To implement security and firewall configurations in each stack, you can use a combination of security groups and network access control lists (NACLs). Security groups are stateful, meaning they allow return traffic automatically, while NACLs are stateless and allow more granular control over traffic at the subnet level. Here’s how to integrate security configurations into each stack in a modular way.

### Folder Structure with Security Components

```plaintext
multi-cloud-terraform/
├── aws/
│   ├── core/
│   │   ├── vpc.tf
│   │   ├── security_groups_core.tf
│   │   ├── ec2_core.tf
│   │   └── variables.tf
│   ├── data/
│   │   ├── security_groups_data.tf
│   │   ├── ec2_data.tf
│   │   └── variables.tf
│   ├── app/
│   │   ├── security_groups_app.tf
│   │   ├── ec2_app.tf
│   │   └── variables.tf
│   ├── data_science/
│   │   ├── security_groups_data_science.tf
│   │   ├── ec2_data_science.tf
│   │   └── variables.tf
└── main.tf
```

### Security Group and Firewall Examples

Each stack can have its own security group rules tailored to its specific use case. For example:

1. **Core Security Group (security_groups_core.tf)**: This security group allows inbound SSH for management and any other essential traffic for core services (e.g., logging, monitoring).
   ```hcl
   resource "aws_security_group" "core_sg" {
     name        = "core-sg"
     description = "Security group for core infrastructure"

     ingress {
       from_port   = 22
       to_port     = 22
       protocol    = "tcp"
       cidr_blocks = [var.allowed_ips]
     }

     egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```

2. **Data Security Group (security_groups_data.tf)**: This security group restricts access to database ports, allowing only the IPs of trusted applications.
   ```hcl
   resource "aws_security_group" "data_sg" {
     name        = "data-sg"
     description = "Security group for data infrastructure"

     ingress {
       from_port   = 5432
       to_port     = 5432
       protocol    = "tcp"
       cidr_blocks = [var.app_ip]
     }

     egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```

3. **App Security Group (security_groups_app.tf)**: This security group allows HTTP/HTTPS traffic for public-facing application servers.
   ```hcl
   resource "aws_security_group" "app_sg" {
     name        = "app-sg"
     description = "Security group for application servers"

     ingress {
       from_port   = 80
       to_port     = 80
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }

     ingress {
       from_port   = 443
       to_port     = 443
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }

     egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```

4. **Data Science Security Group (security_groups_data_science.tf)**: This security group may allow access to tools and clusters specifically for data science workloads.
   ```hcl
   resource "aws_security_group" "data_science_sg" {
     name        = "data-science-sg"
     description = "Security group for data science resources"

     ingress {
       from_port   = 8888
       to_port     = 8888
       protocol    = "tcp"
       cidr_blocks = [var.allowed_ips]
     }

     egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```

### Network ACLs (Optional)

Network ACLs can be configured in `core` for subnet-level controls. For example:

`nacl.tf`
```hcl
resource "aws_network_acl" "core_nacl" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.allowed_ips
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}
```

### Attaching Security Groups to EC2 Instances

Each EC2 configuration in the stacks can specify the appropriate security group. For example, in `ec2_app.tf`:

```hcl
resource "aws_instance" "app_ec2" {
  ami             = var.app_ami_id
  instance_type   = var.app_instance_type
  security_groups = [aws_security_group.app_sg.name]
}
```

### Summary

- **Security Groups**: Define specific security groups for each stack (core, data, app, data science).
- **Network ACLs**: Optional, used for additional subnet-level control.
- **Modularity**: Each stack (core, data, app, data science) has its security settings, improving modularity and separation of concerns.

This approach ensures that each environment has tailored security configurations, facilitating controlled access and adherence to security best practices.

### To manage organization-wide security rules across multiple cloud providers and environments (e.g., development, staging, production)

To manage organization-wide security rules across multiple cloud providers and environments (e.g., development, staging, production), it’s best to centralize and standardize your security policies by organizing common configurations and rules into reusable modules. Here’s an approach using Terraform modules and environment-specific overrides.

### Steps to Manage Organization-Wide Security Rules

1. **Define a Centralized Security Module**: Create a module for each cloud provider with common security rules.
2. **Create Environment-Specific Overrides**: Use variables and conditionals to apply different rules based on the environment (e.g., `dev`, `staging`, `prod`).
3. **Use Multiple Cloud Providers in Each Module**: Centralize management for AWS, Azure, and GCP by defining a module that includes configurations for each provider.
4. **Separate Environment-Specific Configurations**: Structure your Terraform code to include environment directories (e.g., `environments/dev`, `environments/prod`) that use the security module with environment-specific values.

### Example Folder Structure

```plaintext
multi-cloud-terraform/
├── modules/
│   ├── security/
│   │   ├── aws_security.tf
│   │   ├── azure_security.tf
│   │   ├── gcp_security.tf
│   │   └── variables.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── provider.tf
│   ├── staging/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── provider.tf
│   └── prod/
│       ├── main.tf
│       ├── terraform.tfvars
│       └── provider.tf
└── main.tf
```

### Step 1: Create the Centralized Security Module (`modules/security`)

In `modules/security`, define organization-wide rules that can be used across environments and providers.

#### `aws_security.tf`
```hcl
resource "aws_security_group" "org_security_group" {
  name        = "${var.environment}-org-sg"
  description = "Organization-wide security group for ${var.environment} environment"

  // Common Ingress Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Common Egress Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

#### `azure_security.tf`
```hcl
resource "azurerm_network_security_group" "org_nsg" {
  name                = "${var.environment}-org-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22"]
    source_address_prefixes    = var.allowed_ssh_ips
    destination_address_prefix = "*"
  }
}
```

#### `gcp_security.tf`
```hcl
resource "google_compute_firewall" "org_firewall" {
  name    = "${var.environment}-org-firewall"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = var.allowed_ssh_ips
}
```

#### `variables.tf`
```hcl
variable "environment" {
  description = "Deployment environment"
}

variable "allowed_ssh_ips" {
  description = "List of IPs allowed to SSH into resources"
  type        = list(string)
}

variable "location" {
  description = "Location for Azure resources"
  default     = "East US"
}

variable "resource_group_name" {
  description = "Azure resource group name"
}

variable "network" {
  description = "GCP network name"
}
```

### Step 2: Configure Environments to Use the Security Module

In each environment (e.g., `environments/dev`), configure `main.tf` to use the security module with environment-specific values.

#### `environments/dev/main.tf`
```hcl
module "org_security" {
  source = "../../modules/security"
  environment = "dev"
  allowed_ssh_ips = ["203.0.113.0/24"]  // Example: dev environment IP range
  location = "East US"
  resource_group_name = "dev-rg"
  network = "default"
}
```

#### `environments/prod/main.tf`
```hcl
module "org_security" {
  source = "../../modules/security"
  environment = "prod"
  allowed_ssh_ips = ["192.168.1.0/24"]  // Example: restricted prod IP range
  location = "East US"
  resource_group_name = "prod-rg"
  network = "prod-network"
}
```

### Step 3: Environment-Specific Overrides (`terraform.tfvars`)

Each environment can have a `terraform.tfvars` file to specify additional settings like IP ranges, locations, or other values specific to that environment.

#### `environments/dev/terraform.tfvars`
```hcl
allowed_ssh_ips = ["203.0.113.0/24"]
```

#### `environments/prod/terraform.tfvars`
```hcl
allowed_ssh_ips = ["192.168.1.0/24"]
```

### Step 4: Execute Each Environment Separately

To deploy the security configurations for each environment, navigate to the environment directory and run:

```bash
cd environments/dev
terraform init
terraform apply

cd ../prod
terraform init
terraform apply
```

### Summary

- **Centralized Module**: A reusable module for common security rules across AWS, Azure, and GCP, configured in `modules/security`.
- **Environment-Specific Overrides**: Each environment uses the security module with values customized for that environment.
- **Scalability**: Adding more rules or new environments is easy by modifying the module or creating new environment directories.

This approach ensures consistency, maintainability, and centralized control of organization-wide security policies across multiple clouds and environments.
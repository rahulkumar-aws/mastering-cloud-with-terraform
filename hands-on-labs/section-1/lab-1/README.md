We are going to step through all the actions it takes to launch a Virtual Machine on AWS.​

- install terraform​
- populate configuration file (main.tf)​
- `terraform init` — download and install the providers in the configuration file​
- `terraform fmt` — formats the configuration file syntax to be consistent with expected standard​
- `terraform validate` — validates the configuration logic against what is expected by providers​
- `terraform apply` — generate an execution plan, have the user review and accept or reject to apply changes​
- `terraform show` — view the current state of remote objects​
- `terraform state list` — list all the remote objects (cloud resources) currently being managed​
- create **input variables** (variables.tf)​
- create **output values** (outputs.tf)​
- update configuration file (main.tf)​
- `terraform apply` — to apply updated changes ​
- `terraform show` – to observe updated changes​
- `terraform output` — observe output values​
- `terraform destroy` — to destroy all remote objects​
- `terraform login` — store remote state​
- update configure file ()​

HCL (Terraform Language)

Supports:

- Loops (For Each)
- Dynamic Blocks
- Locals
- Complex Data Structure
- Maps, Collections

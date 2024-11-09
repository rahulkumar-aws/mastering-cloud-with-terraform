# Mastering Terraform: IaC with Real-World Examples
---
## Table of Contents: 

## 1. Understand Infrastructure as Code IaC Concepts
1. [Explain what IaC is](./tutorials/1-understand-infrastructure-as-code-iac-concepts/explain-what-iac-is.md)
2. [Describe advantages of IaC patterns](./tutorials/1-understand-infrastructure-as-code-iac-concepts/describe-advantages-of-iac-patterns.md)

## 2. Understand the Purpose of Terraform vs Other IaC
1. [Explain multi-cloud and provider-agnostic benefits](./tutorials/2-understand-the-purpose-of-terraform-vs-other-iac/explain-multi-cloud-and-provider-agnostic-benefits.md)
2. [Explain the benefits of state](./tutorials/2-understand-the-purpose-of-terraform-vs-other-iac/explain-the-benefits-of-state.md)
3. [Manage Resources in Terraform State](./tutorials/2-understand-the-purpose-of-terraform-vs-other-iac/manage-resources-in-terraform-state.md)

## 3. Understand Terraform Basics
1. [Install and version Terraform providers](./tutorials/3-understand-terraform-basics/install-and-version-terraform-providers.md)
2. [Describe plugin-based architecture](./tutorials/3-understand-terraform-basics/describe-plugin-based-architecture.md)
3. [Write Terraform configuration using multiple providers](./tutorials/3-understand-terraform-basics/write-terraform-configuration-using-multiple-providers.md)
4. [Describe how Terraform finds and fetches providers](./tutorials/3-understand-terraform-basics/describe-how-terraform-finds-and-fetches-providers.md)

## 4. Use Terraform Outside the Core Workflow
1. [Describe when to use terraform import to import existing infrastructure into your Terraform state](./tutorials/4-use-terraform-outside-the-core-workflow/use-terraform-import-to-import-existing-infrastructure.md)
2. [Use terraform state to view Terraform state](./tutorials/4-use-terraform-outside-the-core-workflow/use-terraform-state-to-view-terraform-state.md)
3. [Describe when to enable verbose logging and what the outcome/value is](./tutorials/4-use-terraform-outside-the-core-workflow/describe-when-to-enable-verbose-logging.md)

## 5. Interact with Terraform Modules
1. [Contrast and use different module source options including the public Terraform Registry](./tutorials/5-interact-with-terraform-modules/use-different-module-source-options.md)
2. [Interact with module inputs and outputs](./tutorials/5-interact-with-terraform-modules/interact-with-module-inputs-and-outputs.md)
3. [Describe variable scope within modules/child modules](./tutorials/5-interact-with-terraform-modules/describe-variable-scope-within-modules.md)
4. [Set module version](./tutorials/5-interact-with-terraform-modules/set-module-version.md)

## 6. Use the Core Terraform Workflow
1. [Describe Terraform workflow (Write -> Plan -> Create)](./tutorials/6-use-the-core-terraform-workflow/describe-terraform-workflow.md)
2. [Initialize a Terraform working directory (terraform init)](./tutorials/6-use-the-core-terraform-workflow/initialize-a-terraform-working-directory-terraform-init.md)
3. [Validate a Terraform configuration (terraform validate)](./tutorials/6-use-the-core-terraform-workflow/validate-a-terraform-configuration-terraform-validate.md)
4. [Generate and review an execution plan for Terraform (terraform plan)](./tutorials/6-use-the-core-terraform-workflow/generate-and-review-an-execution-plan-for-terraform-terraform-plan.md)
5. [Execute changes to infrastructure with Terraform (terraform apply)](./tutorials/6-use-the-core-terraform-workflow/execute-changes-to-infrastructure-with-terraform-terraform-apply.md)
6. [Destroy Terraform managed infrastructure (terraform destroy)](./tutorials/6-use-the-core-terraform-workflow/destroy-terraform-managed-infrastructure-terraform-destroy.md)
7. [Apply formatting and style adjustments (terraform fmt)](./tutorials/6-use-the-core-terraform-workflow/apply-formatting-and-style-adjustments-terraform-fmt.md)

## 7. Implement and Maintain State
1. [Describe default local backend](./tutorials/7-implement-and-maintain-state/describe-default-local-backend.md)
2. [Describe state locking](./tutorials/7-implement-and-maintain-state/describe-state-locking.md)
3. [Handle backend and cloud integration authentication methods](./tutorials/7-implement-and-maintain-state/handle-backend-and-cloud-integration-authentication-methods.md)
4. [Differentiate remote state backend options](./tutorials/7-implement-and-maintain-state/differentiate-remote-state-backend-options.md)
5. [Manage resource drift and Terraform state](./tutorials/7-implement-and-maintain-state/manage-resource-drift-and-terraform-state.md)
6. [Describe backend block and cloud integration in configuration](./tutorials/7-implement-and-maintain-state/describe-backend-block-and-cloud-integration-in-configuration.md)
7. [Understand secret management in state files](./tutorials/7-implement-and-maintain-state/understand-secret-management-in-state-files.md)

## 8. Read, Generate, and Modify Configuration
1. [Demonstrate use of variables and outputs](./tutorials/8-read-generate-and-modify-configuration/demonstrate-use-of-variables-and-outputs.md)
2. [Describe secure secret injection best practices](./tutorials/8-read-generate-and-modify-configuration/describe-secure-secret-injection-best-practices.md)
3. [Understand the use of collection and structural types](./tutorials/8-read-generate-and-modify-configuration/understand-the-use-of-collection-and-structural-types.md)
4. [Create and differentiate resource and data configuration](./tutorials/8-read-generate-and-modify-configuration/create-and-differentiate-resource-and-data-configuration.md)
5. [Use resource addressing and resource parameters to connect resources together](./tutorials/8-read-generate-and-modify-configuration/use-resource-addressing-and-resource-parameters.md)
6. [Use HCL and Terraform functions to write configuration](./tutorials/8-read-generate-and-modify-configuration/use-hcl-and-terraform-functions.md)
7. [Describe built-in dependency management (order of execution based)](./tutorials/8-read-generate-and-modify-configuration/describe-built-in-dependency-management.md)

## 9. Understand HCP Terraform Capabilities
1. [Explain how HCP Terraform helps manage infrastructure](./tutorials/9-understand-hcp-terraform-capabilities/explain-how-hcp-terraform-helps-manage-infrastructure.md)
2. [Describe how HCP Terraform enables collaboration and governance](./tutorials/9-understand-hcp-terraform-capabilities/describe-how-hcp-terraform-enables-collaboration-and-governance.md)

## [About the Author](./authors.md)

Learn more about the author, including their expertise, background, and professional details, in the [authors.md](./authors.md) file.

## License 

This book is licensed under the **Creative Commons Attribution-NonCommercial-NoDerivs 4.0 International License (CC BY-NC-ND 4.0)**.  
You may share this material freely with attribution but may not use it for commercial purposes or distribute modified versions.  
For more details, see the full [LICENSE](./LICENSE.md).
[![Creative Commons License](https://licensebuttons.net/l/by-nc-nd/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

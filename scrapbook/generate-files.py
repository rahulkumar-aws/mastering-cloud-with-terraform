import os

# Define the folder structure
structure = {
    "terraform-book": {
        "tutorials": {
            "iac-concepts": [
                "what-is-terraform.md",
                "advantages-of-iac.md"
            ],
            "terraform-purpose": [
                "multi-cloud-deployment.md",
                "state-purpose.md",
                "manage-resources-in-state.md"
            ],
            "terraform-basics": [
                "providers.md",
                "manage-versions.md",
                "plugin-architecture.md",
                "provider-configuration.md",
                "initialize-configuration.md"
            ],
            "terraform-core": [
                "import.md",
                "state-command.md",
                "verbose-logging.md"
            ],
            "terraform-modules": [
                "modules-overview.md",
                "input-variables.md",
                "variable-scope.md",
                "module-versions.md"
            ],
            "core-workflow": [
                "core-terraform-workflow.md",
                "init.md",
                "validate.md",
                "plan.md",
                "apply.md",
                "destroy.md",
                "fmt.md"
            ],
            "state": [
                "local-backend.md",
                "state-locking.md",
                "authentication-methods.md",
                "remote-backends.md",
                "resource-drift.md",
                "backend-configuration.md",
                "secret-management.md"
            ],
            "configuration": [
                "variables-and-outputs.md",
                "secure-secrets.md",
                "collection-and-structural-types.md",
                "resource-and-data-config.md",
                "resource-addressing.md",
                "functions.md",
                "dependency-management.md"
            ],
            "hcp-terraform": [
                "overview.md",
                "collaboration-and-governance.md"
            ]
        }
    }
}

# Base directory for creating the structure
base_dir = "/mnt/data/terraform-book"

# Function to create directory structure
def create_structure(base_path, structure):
    for key, value in structure.items():
        path = os.path.join(base_path, key)
        os.makedirs(path, exist_ok=True)
        if isinstance(value, dict):  # If nested dictionary, recurse
            create_structure(path, value)
        elif isinstance(value, list):  # If list of files, create files
            for file in value:
                open(os.path.join(path, file), 'w').close()  # Create empty file

# Create the structure
create_structure(base_dir, structure)

import shutil

# Create a zip file of the generated directory for easy download
shutil.make_archive("/mnt/data/terraform-book", "zip", "/mnt/data/terraform-book")



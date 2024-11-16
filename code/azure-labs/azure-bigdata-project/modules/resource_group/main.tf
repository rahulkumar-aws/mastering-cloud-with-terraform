resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.location
}

# main.tf or resource_groups.tf in the root directory
resource "azurerm_resource_group" "rg1" {
  name     = "databricks-rg-community-test-25yxalcy2gvcg"
  location = "eastus"  # Ensure this matches the actual location in Azure
}

resource "azurerm_resource_group" "rg2" {
  name     = "NetworkWatcherRG"
  location = "eastus"  # Ensure this matches the actual location in Azure
}


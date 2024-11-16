terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "databricks-rg-community-test-25yxalcy2gvcg"
  location = "eastus"
}

resource "azurerm_resource_group" "rg2" {
  name     = "NetworkWatcherRG"
  location = "eastus"  # Ensure this matches the actual location in Azure
}

resource "azurerm_resource_group" "rg3" {
  name     = "azure-bigdata-stack-rg"
  location = "eastus"  # Ensure this matches the actual location in Azure
}
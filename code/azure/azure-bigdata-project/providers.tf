terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"  # Locks the provider to an exact version
    }
  }
}

provider "azurerm" {
  features {}
}

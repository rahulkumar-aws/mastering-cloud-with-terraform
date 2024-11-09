# How to Retrieve Official Azure Images with Terraform

Deploying instances in Azure requires you to select the right VM images from the Azure Marketplace. Images in Azure are categorized by `publisher`, `offer`, and `sku`, each representing an operating system or specific configuration. In this guide, we’ll explore how to retrieve official Azure images using Terraform by filtering based on these identifiers.

## Why Use `Publisher`, `Offer`, and `SKU` for Images?

In Azure, images are organized by publishers, offers, and SKUs:
- **Publisher**: The organization that publishes the image, like Canonical for Ubuntu or Microsoft for Windows Server.
- **Offer**: The product name, such as `UbuntuServer` or `WindowsServer`.
- **SKU**: The specific version or variant, like `20_04-lts` for Ubuntu 20.04 LTS or `2019-Datacenter` for Windows Server 2019.

This structure allows us to precisely select images by specifying these criteria in Terraform.

## Setting Up Terraform to Retrieve Azure Images

Let’s set up Terraform to retrieve some of the most popular official images from the Azure Marketplace: Ubuntu, Windows Server, and Red Hat Enterprise Linux (RHEL).

### Terraform Configuration Example

The following configuration retrieves official images from the Azure Marketplace for Ubuntu 20.04 LTS, Windows Server 2019, and Red Hat Enterprise Linux 8.

```hcl
provider "azurerm" {
  features {}
  # Ensure that you've set your subscription_id, client_id, client_secret, and tenant_id
}

# 1. Ubuntu 20.04 LTS Image
data "azurerm_shared_image_gallery" "ubuntu" {
  location = "East US"
}

data "azurerm_shared_image" "ubuntu_image" {
  name                = "20_04-lts"
  gallery_name        = "UbuntuServer"
  resource_group_name = "galleryResourceGroup"
}

# 2. Windows Server 2019 Image
data "azurerm_shared_image_gallery" "windows" {
  location = "East US"
}

data "azurerm_shared_image" "windows_image" {
  name                = "2019-Datacenter"
  gallery_name        = "WindowsServer"
  resource_group_name = "galleryResourceGroup"
}

# 3. Red Hat Enterprise Linux 8 Image
data "azurerm_shared_image_gallery" "rhel" {
  location = "East US"
}

data "azurerm_shared_image" "rhel_image" {
  name                = "RHEL8"
  gallery_name        = "RedHat"
  resource_group_name = "galleryResourceGroup"
}

# Outputs for each image type
output "ubuntu_image_id" {
  value = data.azurerm_shared_image.ubuntu_image.id
}

output "windows_image_id" {
  value = data.azurerm_shared_image.windows_image.id
}

output "rhel_image_id" {
  value = data.azurerm_shared_image.rhel_image.id
}
```

### Explanation of the Configuration

1. **Provider Block**: This configuration uses the AzureRM provider. Ensure that you have the correct credentials configured in your environment or Terraform workspace.

2. **Data Sources for Images**:
   - **Ubuntu 20.04 LTS**: We retrieve the official Ubuntu 20.04 LTS image from Canonical by using `gallery_name` and specifying the `name` as `20_04-lts`.
   - **Windows Server 2019**: Microsoft’s Windows Server 2019 image is specified using `gallery_name = "WindowsServer"` and `name = "2019-Datacenter"`.
   - **Red Hat Enterprise Linux (RHEL) 8**: RHEL 8 images are available from Red Hat’s gallery, with the `name` set as `RHEL8`.

3. **Outputs**: Each image’s ID is output for easy reference, allowing you to use these IDs for instance creation in other parts of your Terraform configuration.

## Additional Configurations for Specific Needs

### Retrieve Images with GPU Support

For specific workloads that require GPU support, you may want to retrieve Azure’s GPU-enabled images. Here’s how you might configure a data source for an NVIDIA GPU-enabled VM image in Azure.

```hcl
data "azurerm_shared_image_gallery" "gpu_image" {
  location = "East US"
}

data "azurerm_shared_image" "gpu_image" {
  name                = "nvidia-gpu-optimized"
  gallery_name        = "NVIDIA-GPU-Images"
  resource_group_name = "gpuGalleryResourceGroup"
}

output "gpu_image_id" {
  value = data.azurerm_shared_image.gpu_image.id
}
```

### Discover Available Publishers, Offers, and SKUs

If you are unsure of the exact `publisher`, `offer`, or `sku` names, you can explore available options using the Azure CLI:

```bash
# List available publishers in a region
az vm image list-publishers --location eastus --output table

# List available offers from a publisher
az vm image list-offers --location eastus --publisher Canonical --output table

# List available SKUs for a specific offer
az vm image list-skus --location eastus --publisher Canonical --offer UbuntuServer --output table
```

These commands will help you identify the exact names to use in your Terraform configuration for different images.

## Summary

By specifying `publisher`, `offer`, and `sku` in Terraform, you can reliably retrieve official images from the Azure Marketplace, ensuring that your infrastructure is secure and up-to-date. Using owner-specific images from trusted publishers such as Canonical, Microsoft, and Red Hat helps maintain consistency across deployments, which is especially valuable for production environments.

This approach is perfect for DevOps teams, cloud architects, and anyone looking to automate Azure VM deployments with Terraform, using verified images for each environment. Now you’re ready to configure Terraform to pull official images from Azure and streamline your deployment process with confidence!

--- 

With these Terraform configurations, you can easily select official images from trusted publishers, making it simple to deploy standardized VMs across environments in Azure.
module "resource_group" {
  source        = "./modules/resource_group"
  project_name  = var.project_name
  location      = var.location
}

# module "network" {
#   source              = "./modules/network"
#   project_name        = var.project_name
#   resource_group_name = module.resource_group.name
#   location            = var.location
# }

# module "compute" {
#   source              = "./modules/compute"
#   project_name        = var.project_name
#   resource_group_name = module.resource_group.name
#   location            = var.location
#   vm_size             = "Standard_D2_v2"
# }

# module "storage" {
#   source              = "./modules/storage"
#   project_name        = var.project_name
#   resource_group_name = module.resource_group.name
#   location            = var.location
# }

# module "identity" {
#   source              = "./modules/identity"
#   project_name        = var.project_name
#   resource_group_name = module.resource_group.name
#   location            = var.location
# }
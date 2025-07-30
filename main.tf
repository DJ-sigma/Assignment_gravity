module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source     = "./modules/network"
  depends_on = [module.resource_group]

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  public_subnet_name  = var.public_subnet_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_name = var.private_subnet_name
  private_subnet_cidr = var.private_subnet_cidr
  nsg_name            = var.nsg_name
}

module "vm" {

  source     = "./modules/compute"
  depends_on = [module.network]

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  subnet_id           = module.network.public_subnet_id
  nsg_id              = module.network.nsg_id
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

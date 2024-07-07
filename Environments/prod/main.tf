module "Jay-project-Repo-module-rg" {
  source              = "../../module-calling-code/Azurerm_resource_group"
  Jay-project-Repo-rg = var.Jay-project-Repo-rg-module
}

module "Jay-project-Repo-module-vnet" {
  depends_on            = [module.Jay-project-Repo-module-rg]
  source                = "../../module-calling-code/Azurerm_virtual_network"
  Jay-project-Repo-vnet = var.Jay-project-Repo-vnet-module
}

module "Jay-project-Repo-module-subnet" {
  depends_on              = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-module-vnet]
  source                  = "../../module-calling-code/Azurerm_subnet"
  Jay-project-Repo-subnet = var.Jay-project-Repo-subnet-module
}

module "Jay-project-Repo-nic-module" {
  source               = "../../module-calling-code/Azurerm_network_interface"
  depends_on           = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-module-subnet]
  Jay-project-Repo-nic = var.Jay-project-Repo-nic-module
}
module "Jay-project-Repo-public-ip-module" {
  depends_on                 = [module.Jay-project-Repo-module-rg]
  source                     = "../../module-calling-code/Azurerm_public_IP"
  Jay-project-Repo-public-ip = var.Jay-project-Repo-publicip-module

}

module "Jay-project-Repo-keyvault-module" {
  depends_on                = [module.Jay-project-Repo-module-rg, ]
  source                    = "../../module-calling-code/Azurerm_key_vault"
  Jay-project-Repo-keyvault = var.Jay-project-Repo-keyvault-module

}

module "Jay-project-Repo-bastion-module" {
  depends_on               = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-module-vnet, module.Jay-project-Repo-module-subnet]
  source                   = "../../module-calling-code/Azurerm_bastion_host1"
  Jay-project-Repo-bastion = var.Jay-project-Repo-bastion-module

}
module "Jay-project-Repo-lb-module" {
  depends_on = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-public-ip-module, module.Jay-project-Repo-nic-module, module.Jay-project-Repo-module-vnet]
  source     = "../../module-calling-code/Azurerm_Load_balancer"
  jay-lb     = var.Jay-project-Repo-jay-lb-module

}

module "Jay-project-Repo-vnetpeering-module" {
  depends_on                   = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-module-vnet]
  source                       = "../../module-calling-code/Azurerm_Virtual_Network_Peering"
  Jay-project-Repo-vnetpeering = var.Jay-project-Repo-vnetpeering-module
}

module "Jay-project-Repo-linux-vm-module" {
  depends_on                = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-nic-module, module.Jay-project-Repo-keyvault-module, module.Jay-project-Repo-nsg-module]
  source                    = "../../module-calling-code/Azurerm_linux_virtual_machine"
  Jay-linux-virtual_machine = var.Jay-project-Repo-linux-vm
}

module "Jay-project-Repo-storage-module" {
  depends_on  = [module.Jay-project-Repo-module-rg]
  source      = "../../module-calling-code/Azurerm_Storage_account"
  Jay-storage = var.Jay-project-Repo-storage-module
}

module "Jay-project-Repo-container-module" {
  depends_on    = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-storage-module]
  source        = "../../module-calling-code/Azurerm_container"
  Jay-container = var.Jay-project-Repo-container-module
}
module "Jay-project-Repo-nsg-module" {
  depends_on = [module.Jay-project-Repo-module-rg]
  source     = "../../module-calling-code/Azurerm_Network_security_group"
  Jay-nsg    = var.Jay-project-Repo-nsg-module
}

# module "Jay-project-Repo-sqlserver-module" {
#   depends_on = [module.Jay-project-Repo-module-rg, module.Jay-project-Repo-keyvault-module, module.Jay-project-Repo-storage-module, module.Jay-project-Repo-container-module]
#   source     = "../../module-calling-code/Azurerm_Sql_database"
#   sqlserver  = var.Jay-project-Repo-sqlserver-module
# }

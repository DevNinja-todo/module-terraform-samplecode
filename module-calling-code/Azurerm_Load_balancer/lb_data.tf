data "azurerm_public_ip" "Jay-project-Repo-public-ip" {
  name                = "Jay-publicip01"
  resource_group_name = "Jay-rg-preprod"
}
data "azurerm_network_interface" "Jay-project-Repo-nic" {
  for_each = var.jay-lb
  name                = each.value.nic_name
  resource_group_name =each.value.rg_name
}

data "azurerm_network_interface" "Jay-project-Repo-nic1" {
  for_each = var.jay-lb
  name                = each.value.nic_name1
  resource_group_name =each.value.rg_name
}

data "azurerm_virtual_network" "Jay-project-Repo-vnet" {
  for_each = var.jay-lb
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}
resource "azurerm_lb" "Jay-lb" {
    for_each = var.jay-lb
  name                = each.value.lb_name
  location            =each.value.location
  resource_group_name = each.value.rg_name
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "jayconfig"
    public_ip_address_id = data.azurerm_public_ip.Jay-project-Repo-public-ip.id
  }
}
resource "azurerm_lb_backend_address_pool" "Jay-backendpool" {
  for_each = var.jay-lb
  loadbalancer_id = azurerm_lb.Jay-lb[each.key].id
  name            = each.value.bnkd_name
}

resource "azurerm_lb_probe" "jay-lbprob" {
  for_each = var.jay-lb
  loadbalancer_id = azurerm_lb.Jay-lb[each.key].id
  name            = each.value.lbprob_name 
  port            = 80
}

resource "azurerm_lb_rule" "jay-lbrule" {
  for_each = var.jay-lb
  loadbalancer_id                = azurerm_lb.Jay-lb[each.key].id
  name                           = each.value.lbrule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "jayconfig"
  probe_id = azurerm_lb_probe.jay-lbprob[each.key].id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.Jay-backendpool[each.key].id]
}

resource "azurerm_lb_backend_address_pool_address" "bnkdpool-vm" {
  for_each = var.jay-lb
  name                    = each.value.linux_vm_name  
  backend_address_pool_id = azurerm_lb_backend_address_pool.Jay-backendpool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.Jay-project-Repo-vnet[each.key].id
   ip_address              = data.azurerm_network_interface.Jay-project-Repo-nic[each.key].private_ip_address
}
resource "azurerm_lb_backend_address_pool_address" "bnkdpool-vm0" {
  for_each = var.jay-lb
  name                    = each.value.linux_vm_name1  
  backend_address_pool_id = azurerm_lb_backend_address_pool.Jay-backendpool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.Jay-project-Repo-vnet[each.key].id
 ip_address               = data.azurerm_network_interface.Jay-project-Repo-nic1[each.key].private_ip_address
}

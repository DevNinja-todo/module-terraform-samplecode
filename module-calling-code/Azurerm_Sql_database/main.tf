# resource "azurerm_mysql_flexible_server" "Jay-sqlserver" {
#    for_each = var.sqlserver
#   name                         = each.value.sql_name
#   resource_group_name          = each.value.rg_name
#   location                     = each.value.location
#   administrator_login          = data.azurerm_key_vault_secret.jayusername[each.key].value
#   administrator_password = data.azurerm_key_vault_secret.jayuserpassword[each.key].value
#   sku_name               = "B_Standard_B1s"
# }

# resource "azurerm_mysql_flexible_database" "Jay-sqldatabase" {
#  for_each = var.sqlserver
#   name                = each.value.sqldatabase_name
#   resource_group_name = each.value.rg_name
#   server_name         = azurerm_mysql_flexible_server.Jay-sqlserver[each.key].name
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }
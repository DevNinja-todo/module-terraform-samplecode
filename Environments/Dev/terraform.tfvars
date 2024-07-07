Jay-project-Repo-rg-module = {
  RG01 = {
    rg_name  = "Jay-rg1-dev"
    location = "centralindia"
  }

  RG02 = {
    rg_name  = "Jay-rg--dev"
    location = "eastasia"
  }
}

Jay-project-Repo-vnet-module = {
  vnet01 = {
    vnet_name     = "Jay-vnet1-dev"
    rg_name       = "Jay-rg1-dev"
    location      = "centralindia"
    address_space = ["10.0.0.0/16"]
  }
  vnet1 = {
    vnet_name     = "Jay-vnet1-dev"
    rg_name       = "Jay-rg--dev"
    location      = "eastasia"
    address_space = ["10.0.0.0/16"]
  }
  vnet02 = {
    vnet_name     = "Jay-vnet2-dev"
    rg_name       = "Jay-rg--dev"
    location      = "eastasia"
    address_space = ["10.1.0.0/16"]
  }

}
Jay-project-Repo-subnet-module = {
  subnet1 = {
    subnet_name      = "Jay-subnet"
    vnet_name        = "Jay-vnet2-dev"
    rg_name          = "Jay-rg--dev"
    location         = "eastasia"
    address_prefixes = ["10.1.0.0/24"]
  }
  subnet02 = {
    subnet_name      = "Jay-subnet01"
    vnet_name        = "Jay-vnet1-dev"
    rg_name          = "Jay-rg--dev"
    location         = "eastasia"
    address_prefixes = ["10.0.0.0/24"]
  }
  subnet04 = {
    subnet_name      = "Jay-subnet03"
    vnet_name        = "Jay-vnet1-dev"
    rg_name          = "Jay-rg--dev"
    location         = "eastasia"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet = {
    subnet_name      = "AzureBastionSubnet"
    vnet_name        = "Jay-vnet1-dev"
    rg_name          = "Jay-rg--dev"
    location         = "eastasia"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet03 = {
    subnet_name      = "Jay-subnet02"
    vnet_name        = "Jay-vnet1-dev"
    rg_name          = "Jay-rg1-dev"
    location         = "centralindia"
    address_prefixes = ["10.0.0.0/24"]
  }
}

Jay-project-Repo-nic-module = {
  nic01 = {
    nic_name    = "Jay-nic"
    subnet_name = "Jay-subnet"
    vnet_name   = "Jay-vnet2-dev"
    rg_name     = "Jay-rg--dev"
    location    = "eastasia"
  }
  nic02 = {
    nic_name    = "Jay-nic01"
    subnet_name = "Jay-subnet01"
    vnet_name   = "Jay-vnet1-dev"
    rg_name     = "Jay-rg--dev"
    location    = "eastasia"
  }
  nic04 = {
    nic_name    = "Jay-nic02"
    subnet_name = "Jay-subnet01"
    vnet_name   = "Jay-vnet1-dev"
    rg_name     = "Jay-rg--dev"
    location    = "eastasia"
  }


  nic03 = {
    nic_name    = "Jay-nic03"
    subnet_name = "Jay-subnet03"
    vnet_name   = "Jay-vnet1-dev"
    rg_name     = "Jay-rg--dev"
    location    = "eastasia"
  }
}

Jay-project-Repo-publicip-module = {
  public01 = {
    publicip_name = "Jay-publicip0"
    rg_name       = "Jay-rg--dev"
    location      = "eastasia"
  }
  public = {
    publicip_name = "Jay-publicip"
    rg_name       = "Jay-rg--dev"
    location      = "eastasia"
  }
  public02 = {
    publicip_name = "Jay-publicip01"
    rg_name       = "Jay-rg--dev"
    location      = "eastasia"
  }
  public03 = {
    publicip_name = "Jay-publicip1"
    rg_name       = "Jay-rg1-dev"
    location      = "centralindia"
  }
}
Jay-project-Repo-keyvault-module = {
  key01 = {
    key_vault_name = "Jay-keyvault01"
    rg_name        = "Jay-rg1-dev"
    location       = "centralindia"
  }
  key02 = {
    key_vault_name = "Jay-keyvault02"
    rg_name        = "Jay-rg--dev"
    location       = "eastasia"
  }
}

Jay-project-Repo-bastion-module = {
  bastion01 = {
    bastion_name  = "Jay-bastion"
    rg_name       = "Jay-rg--dev"
    location      = "eastasia"
    subnet_name   = "AzureBastionSubnet"
    publicip_name = "Jay-publicip"
    vnet_name     = "Jay-vnet1-dev"
  }
}

Jay-project-Repo-vnetpeering-module = {
  vnetpeering = {
    vnetpeering_name  = "Jay-vnet1-devtoJay-vnet2-dev"
    vnetpeering_name1 = "Jay-vnet2-devtoJay-vnet1-dev"
    vnet_name         = "Jay-vnet1-dev"
    vnet_name1        = "Jay-vnet2-dev"
    rg_name           = "Jay-rg--dev"
  }
}

Jay-project-Repo-storage-module = {
  storage01 = {
    storage-name = "jaystr034"
    rg_name      = "Jay-rg--dev"
    location     = "eastasia"
  }
  # storage02 = {
  #   storage-name = "jayp2451"
  #   rg_name      = "Jay-rg1-dev"
  #   location     = "centralindia"


  # }
}

Jay-project-Repo-container-module = {
  cont1 = {
    container_name = "jayprojectcont"
    storage-name   = "jaystr034"
    rg_name        = "Jay-rg--dev"
  }
  # cont2 = {
  #   container_name = "jayprojectcont"
  #   storage-name   = "jaypr01241"
  #   rg_name        = "Jay-rg1-dev"
  # }
}

Jay-project-Repo-nsg-module = {
  nsg01 = {
    nsg_name = "Jay-nsg"
    rg_name  = "Jay-rg--dev"
    location = "eastasia"
  }
  nsg02 = {
    nsg_name = "Jay-nsg1"
    rg_name  = "Jay-rg1-dev"
    location = "centralindia"
  }
}

Jay-project-Repo-linux-vm = {
  linuxvm = {
    linux_vm_name             = "Frontend-vm01"
    rg_name                   = "Jay-rg--dev"
    location                  = "eastasia"
    vm_size                   = "Standard_B1s"
    caching_name              = "ReadWrite"
    storage_account_type_name = "Standard_LRS"
    publisher_name            = "Canonical"
    offer_name                = "0001-com-ubuntu-server-jammy"
    sku_name                  = "22_04-lts"
    version_name              = "latest"
    nic_name                  = "Jay-nic02"
    nsg_name                  = "Jay-nsg"
    key_vault_name            = "Jay-keyvault02"
    secret_name               = "userlinuxvm02"
    secret_password           = "userpasswordvm02"
  }
  linuxvm02 = {
    linux_vm_name             = "Frontend-vm2"
    rg_name                   = "Jay-rg--dev"
    location                  = "eastasia"
    vm_size                   = "Standard_DS1_v2"
    caching_name              = "ReadWrite"
    storage_account_type_name = "Standard_LRS"
    publisher_name            = "Canonical"
    offer_name                = "0001-com-ubuntu-server-jammy"
    sku_name                  = "22_04-lts"
    version_name              = "latest"
    nsg_name                  = "Jay-nsg"
    nic_name                  = "Jay-nic01"
    key_vault_name            = "Jay-keyvault02"
    secret_name               = "linuxvmuser01"
    secret_password           = "userpasswordvm01"
  }

  linuxvm03 = {
    linux_vm_name             = "Backend-vm01"
    rg_name                   = "Jay-rg--dev"
    location                  = "eastasia"
    vm_size                   = "Standard_B2s"
    caching_name              = "ReadWrite"
    storage_account_type_name = "Standard_LRS"
    publisher_name            = "Canonical"
    offer_name                = "0001-com-ubuntu-server-jammy"
    sku_name                  = "22_04-lts"
    version_name              = "latest"
    nic_name                  = "Jay-nic03"
    key_vault_name            = "Jay-keyvault02"
    secret_name               = "userlinuxvm03"
    secret_password           = "userpasswordvm03"
    nsg_name                  = "Jay-nsg"
  }
}

Jay-project-Repo-sqlserver-module = {
  sqlserver = {
    sql_name         = "jaysqlserver"
    rg_name          = "Jay-rg--dev"
    location         = "eastasia"
    sqldatabase_name = "jaysqldatabase"
    secret_name      = "linuxvmuser01"
    secret_password  = "userpasswordvm01"
    key_vault_name   = "Jay-keyvault02"

  }
}




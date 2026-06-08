# ---------------- RESOURCE GROUPS ----------------
rgs-vinav = {
  rg1 = {
    name     = "rg-vinav14"
    location = "centralus"
  }
  rg2 = {
    name     = "rg-vinav15"
    location = "centralus"
  }
 
}
# ---------------- STORAGE ACCOUNT ----------------
storage_accounts = {
  sa1 = {
    name                     = "vinavstorage98"
    resource_group_name      = "rg-vinav14"
    location                 = "centralus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

# ---------------- VNET ----------------
vnet = {
  vnet1 = {
    name                = "vinav_vnet"
    resource_group_name = "rg-vinav14"
    location            = "centralus"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vinav_vnet2"
    resource_group_name = "rg-vinav15"
    location            = "centralus"
    address_space       = ["20.0.0.0/15"]
  }
}

# ---------------- SUBNET ----------------
subnet = {
  subnet1 = {
    name                 = "Frontend_subnet"
    resource_group_name  = "rg-vinav14"
    virtual_network_name = "vinav_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "Banckend_subnet"
    resource_group_name  = "rg-vinav15"
    virtual_network_name = "vinav_vnet2"
    address_prefixes     = ["20.0.1.0/24"]
  }
  # subnet3 = {
  #   name                 = "AzureBastionSubnet"
  #   resource_group_name  = "rg-vinav14"
  #   virtual_network_name = "vinav_vnet"
  #   address_prefixes     = ["10.0.2.0/24"]
  # }
}

# ---------------- LINUX VM (NO CREDS HERE ❌) ----------------
linux_vm = {
  vm1 = {
    name                = "Fromtendvm"
    resource_group_name = "rg-vinav14"
    location            = "centralus"
    size                = "Standard_D2s_v4"
    subnet_id           = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/rg-vinav14/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/Frontend_subnet"
  }

  vm2 = {
    name                = "Backendvm"
    resource_group_name = "rg-vinav15"
    location            = "centralus"
    size                = "Standard_D2s_v4"
    subnet_id           = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/rg-vinav15/providers/Microsoft.Network/virtualNetworks/vinav_vnet2/subnets/Banckend_subnet"
  }
}

# ---------------- AKS ----------------
aks = {
  aks1 = {
    name                = "vinavaks1"
    location            = "centralus"
    resource_group_name = "rg-vinav14"
    dns_prefix          = "vinavaksdns1"
  }
  aks2 = {
    name                = "vinavaks2"
    location            = "centralus"
    resource_group_name = "rg-vinav15"
    dns_prefix          = "vinavaksdns2"
  }
}

# ---------------- ACR ----------------
azurerm_container_registry = {
  acr1 = {
    name                = "vinavacr16"
    resource_group_name = "rg-vinav14"
    location            = "centralus"
    sku                 = "Basic"
    admin_enabled       = true
  }
}

# ---------------- SQL SERVER ----------------
sql_servers = {
  sql1 = {
    name                         = "vinavsqlserver3"
    resource_group_name          = "rg-vinav15"
    location                     = "centralus"
    administrator_login          = "sqladminuser"
    administrator_login_password = "SqlAdmin@1234"
    version                      = "12.0"
  }
}

# # ---------------- BASTION ----------------
# azurerm_bastion_host = {
#   bastion1 = {
#     name                = "vinavbastionhost1"
#     location            = "centralus"
#     resource_group_name = "rg-vinav14"

#     ip_configuration = {
#       name                 = "bastionipconfig2"
#       subnet_id            = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb /resourceGroups/rg-vinav14/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/AzureBastionSubnet"
#       public_ip_address_id = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb /resourceGroups/rg-vinav14/providers/Microsoft.Network/publicIPAddresses/vinavbastionpublicip"
#     }
#   }
# }

# ---------------- PUBLIC IP ----------------
azurerm_public_ip = {
  # pip1 = {
  #   name                = "vinavbastionpublicip"
  #   resource_group_name = "rg-vinav14"
  #   location            = "centralus"
  #   allocation_method   = "Static"
  # }
  vm1 = {
    name                = "vinavvm1-pip"
    resource_group_name = "rg-vinav14"
    location            = "centralus"
    allocation_method   = "Static"
  }

  vm2 = {
    name                = "vinavvm2-pip"
    resource_group_name = "rg-vinav15"
    location            = "centralus"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "vinavlbpublicip1"
    resource_group_name = "rg-vinav14"
    location            = "centralus"
    allocation_method   = "Static"
  }
}

# ---------------- NIC ----------------
nic = {
  vm1 = {
    name                = "vinavvm1"
    location            = "centralus"
    resource_group_name = "rg-vinav14"
    subnet_id           = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/rg-vinav14/providers/Microsoft.Network/virtualNetworks/vinav_vnet/subnets/Frontend_subnet"
  }
  vm2 = {
    name                = "vinavvm2"
    location            = "centralus"
    resource_group_name = "rg-vinav15"
    subnet_id           = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/rg-vinav15/providers/Microsoft.Network/virtualNetworks/vinav_vnet2/subnets/Banckend_subnet"
  }
}

# ---------------- KEY VAULT (MAP) ----------------
azurerm_key_vaults = {
  kv1 = {
    name                = "vinavkeyvault81"
    location            = "centralus"
    resource_group_name = "rg-vinav14"
  }
  kv2 = {
    name                = "vinavkeyvault82"
    location            = "centralus"
    resource_group_name = "rg-vinav15"
  }
}

# ---------------- LOAD BALANCER ----------------
lb = {
  lb1 = {
    name                = "vinavlb1"
    location            = "centralus"
    resource_group_name = "rg-vinav14"
    sku                 = "Standard"

    frontend_ip_configuration = [
      {
        name                 = "vinavlb1-fe"
        public_ip_address_id = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/rg-vinav14/providers/Microsoft.Network/publicIPAddresses/vinavlbpublicip1"
      }
    ]
  }
}

# ---------------- NSG ----------------
nsg = {
  nsg1 = {
    name                = "vinavnsg1"
    resource_group_name = "rg-vinav14"
    location            = "centralus"
  }
}

# ---------------- GLOBAL VM CREDS (ONLY HERE ✅) ----------------
vm_admin_username = "vinavadmin"
vm_admin_password = "Admin@1234"

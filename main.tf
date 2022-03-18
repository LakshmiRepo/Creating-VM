provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion     = true
      skip_shutdown_and_force_delete = true
    }
  }
}

data "azurerm_resource_group" "VMResource" {
  name = "rgforvn"

}
data "azurerm_subnet" "VMSubnet" {
  name                 = "Subnet1"
  resource_group_name  = "rgforvn"
  virtual_network_name = "VNet1"
}

module "VM" {
  source = "../ModuleDataSourceVM"
  rgname = data.azurerm_resource_group.VMResource.name
  VMName = "DatasourceVM"
  size = "Standard_B16ms"
  subnetid = data.azurerm_subnet.VMSubnet.id
  adminpwd = var.adminpw
  localadminname = var.localadmin
  location = data.azurerm_resource_group.VMResource.location

}

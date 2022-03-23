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
  name                 = "default"
  resource_group_name  = "rgforvn"
  virtual_network_name = "vnet3"
}

module "VM" {
  source         = "../ModuleDataSourceVM"
  rgname         = data.azurerm_resource_group.VMResource.name
  VMName         = "DatasourceVM"
  size           = "Standard_B1s"
  subnetid       = data.azurerm_subnet.VMSubnet.id
  adminpwd       = var.adminpw
  localadminname = var.localadmin
  location       = "WestUS"
}

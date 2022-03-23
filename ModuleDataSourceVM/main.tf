

resource "azurerm_network_interface" "VMNetworkInterface" {
  location            = var.location
  name                = "${var.VMName}NI"
  resource_group_name = var.rgname
  ip_configuration {
    name                          = "IPConfigof${var.VMName}"
    private_ip_address_allocation = "Dynamic"
    subnet_id = var.subnetid
  }
}

resource "azurerm_windows_virtual_machine" "VM" {
  admin_password        = var.adminpwd
  admin_username        = var.localadminname
  location              = var.location
  name                  = var.VMName
  network_interface_ids = [
    azurerm_network_interface.VMNetworkInterface.id
  ]
  resource_group_name = var.rgname
  size                = var.size
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadOnly"
    storage_account_type = "Standard_LRS"
  }
}
  

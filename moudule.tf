
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
  location              = "East US"
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

/*var section*/

variable "rgname" {
  type = string
  default = "The name of the existing resource group"
}
variable "size" {
  type = string
  default = "The size of the VM"
}
variable "VMName" {
  type = string
  default = "The name of the VM"
}
variable "localadminname" {
  type = string
  default = "The local admin account cannot be administrator"
}
variable "adminpwd" {
  type = string
  sensitive = true
  default = "The local admin password"
}
variable "subnetid" {
  type = string
  default = "The subnet id that the network card attaches to"
}
variable "location" {
  type = string
}

/* output section*/

output "VM_id_out" {
  value = azurerm_windows_virtual_machine.VM.id
}

output "VM_ip_out" {
  value = azurerm_network_interface.VMNetworkInterface.private_ip_addresses
}


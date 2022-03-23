/* output section*/


output "VM_id_out" {
  value = azurerm_windows_virtual_machine.VM.id
}

output "VM_ip_out" {
  value = azurerm_network_interface.VMNetworkInterface.private_ip_addresses
}


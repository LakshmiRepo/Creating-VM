output "VM_id" {
  value       = module.VM.VM_id_out
  description = "The ID of the new VM"

}

output "VM_ip" {
  value       = module.VM.VM_ip_out
  description = "The private IP address for the new VM"
}

/* password to VM

  Enter a value: sateesh1@danda
*/

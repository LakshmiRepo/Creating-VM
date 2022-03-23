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

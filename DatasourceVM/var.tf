variable "adminpw" {
  type = string
  sensitive = true
  description = "The local adminpassword,must be 12 char"
}
variable "localadmin" {
  type = string
  default = "ladandamudi"
  description = "The local admin name"
}


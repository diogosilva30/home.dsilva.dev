
# Define variables for connection with proxmox
# server
variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}
variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}
variable "ipconfig0" {
  description = "The IP configuration for network interface 0"
  type        = string
}
variable "ciuser" {
  description = "The name of the default user that should be created"
  type        = string
}
variable "ssh_keys" {
  description = "The SSH key to add to the VM"
  type        = string
}
variable "nameserver" {
  description = "The name server for the VM"
  type        = string
  default     = "8.8.8.8"
}

variable "disk_size" {
  description = "The disk size. E.g. '50GB'"
  type        = string
  default     = "50GB"
}
variable "memory" {
  description = "The ammount of memory. E.g. '2048'"
  type        = string
  default     = "2048"
}

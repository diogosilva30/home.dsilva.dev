
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
variable "ssh_private_key" {
  description = "The private SSH key for terraform to SSH into the machine"
  sensitive   = false
  type        = string
}
variable "nameserver" {
  description = "The name server for the VM"
  type        = string
  default     = "8.8.8.8"
}
variable "disk_size" {
  description = "The disk size. E.g. '50G'"
  type        = string
  default     = "50G"
}
variable "memory" {
  description = "The ammount of memory. E.g. '2048'"
  type        = number
  default     = 3072 # 3gb of RAM
}
variable "cores" {
  description = "The number of CPU cores of the VM"
  type        = number
  default     = 2
}
variable "deployment_path" {
  description = "The folder that should be created inside the VM for deployment. The CI user is granted write permissions on this folder"
  type        = string
}


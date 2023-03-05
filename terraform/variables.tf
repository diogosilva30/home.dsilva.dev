
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
  sensitive   = true
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
variable "hostname" {
  description = "The hostname for the cloudflared tunnel (e.g. home.yourdomain.com)"
  type        = string
}
# Cloudflare variables
variable "cloudflare_zone_id" {
  description = "Zone ID for your domain"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Account ID for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "Email address for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_token" {
  description = "Cloudflare API token created at https://dash.cloudflare.com/profile/api-tokens"
  type        = string
}




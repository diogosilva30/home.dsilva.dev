terraform {
  required_version = ">= 0.13.0"

  required_providers {
    # https://github.com/Telmate/terraform-provider-proxmox
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}


provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
  pm_log_enable       = true
  pm_log_file         = "terraform-plugin-proxmox.log"
  pm_debug            = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

resource "proxmox_vm_qemu" "home_assistant" {
  name        = "home-assistant"
  desc        = "Home assistant VM"
  target_node = "proxmox"
  agent       = 1

  clone   = "ubuntu-server-22"
  cores   = 2
  sockets = 1
  cpu     = "host"
  memory  = var.memory

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    storage = "local"
    type    = "virtio"
    size    = var.disk_size
  }
  os_type = "cloud-init"
  # Use the ipconfig0 variable to set the IP configuration
  ipconfig0  = var.ipconfig0
  nameserver = var.nameserver
  ciuser     = var.ciuser
  sshkeys    = var.ssh_keys

}


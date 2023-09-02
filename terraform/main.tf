terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket                      = "terraform-states"
    key                         = "home-dsilva-dev.tfstate"
    endpoint                    = "https://s3-api.dsilva.dev"
    force_path_style            = true
    region                      = "eu-south-2"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
  required_providers {
    # https://github.com/Telmate/terraform-provider-proxmox
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.3"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

# Providers
provider "cloudflare" {
  api_token = var.cloudflare_token
}
provider "random" {}
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

# Generates a 35-character secret for the tunnel.
resource "random_id" "tunnel_secret" {
  byte_length = 35
}

# Creates a new locally-managed tunnel for the VM.
resource "cloudflare_tunnel" "tunnel" {
  account_id = var.cloudflare_account_id
  name       = "homeassistant"
  secret     = random_id.tunnel_secret.b64_std
}

# Creates the CNAME record for the tunnel
resource "cloudflare_record" "homeassistant" {
  zone_id = var.cloudflare_zone_id
  name    = var.hostname
  value   = "${cloudflare_tunnel.tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}


resource "proxmox_vm_qemu" "home_assistant" {
  name        = "home-assistant"
  desc        = "Home assistant VM"
  target_node = "proxmox"
  onboot      = true
  agent       = 1
  clone       = "debian-server-11"
  cores       = var.cores
  sockets     = 1
  cpu         = "host"
  memory      = var.memory

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }


  disk {
    size    = "50G"
    storage = "local"
    type    = "virtio"
  }

  os_type         = "cloud-init"
  ipconfig0       = "ip=dhcp"
  nameserver      = var.nameserver
  ciuser          = var.ciuser
  sshkeys         = var.ssh_keys
  ssh_private_key = var.ssh_private_key
  ssh_user        = var.ciuser

  connection {
    type        = "ssh"
    host        = self.ssh_host # Auto-assigned ip address
    user        = self.ssh_user
    private_key = self.ssh_private_key
    port        = self.ssh_port
  }


  provisioner "local-exec" {
    # Create the private key for ansible connection,
    # and install ansible
    command = <<-EOT
    echo "${self.ssh_private_key}" > privkey
    chmod 600 privkey
    EOT
  }
  # Install cloudflare tunnel with ansible playbook
  provisioner "local-exec" {
    command = <<-EOT
    ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
    -u ${self.ssh_user} \
    --private-key privkey \
    -i ${self.ssh_host}, ../ansible/install_tunnel.yml
    EOT
  }
  # Install home assistant supervised with ansible playbook
  provisioner "local-exec" {
    command = <<-EOT
    ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
    -u ${self.ssh_user} \
    --private-key privkey \
    -i ${self.ssh_host}, ../ansible/install_homeassistant.yml
    EOT
  }
  # Generate the tunnel configuration file for ansible
  # and the ansible vars file
  depends_on = [
    local_file.tunnel_config,
    local_file.vars_file
  ]
}


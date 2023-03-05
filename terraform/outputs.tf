output "ip_address" {
  description = "Ip address of Home Assistant instance"
  value       = proxmox_vm_qemu.home_assistant.ssh_host
}
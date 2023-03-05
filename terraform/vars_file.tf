resource "local_file" "vars_file" {
  content = <<-DOC
    # Ansible vars_file containing variable values from Terraform.
    tunnel_id: ${cloudflare_tunnel.tunnel.id}
    account: ${var.cloudflare_account_id}
    tunnel_name: ${cloudflare_tunnel.tunnel.name}
    secret: ${random_id.tunnel_secret.b64_std}
    DOC

  filename = "../vars_file.yml"
}
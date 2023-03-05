# Generates the cloudflared tunnel config yaml file
resource "local_file" "tunnel_config" {
  content = <<-DOC
    tunnel: "${cloudflare_tunnel.tunnel.id}"
    credentials-file: /etc/cloudflared/cert.json
    logfile: /var/log/cloudflared.log
    loglevel: info
    # Define ingress rules
    ingress:
        - hostname: '${var.hostname}'
          service: http://localhost:8123 # default port for home assistant
        # Default catch-all rule
        - service: http_status:404
    DOC
  # Export the config file to root of the repository
  filename = "../tunnel_config.yml"
}
resource "local_file" "ha_config" {
  # Create a default configuration file for home assistant
  content = <<-EOT
    # Loads default set of integrations. Do not remove.
    default_config:

    # Load frontend themes from the themes folder
    frontend:
    themes: !include_dir_merge_named themes

    # Text to speech
    tts:
    - platform: google_translate

    automation: !include automations.yaml
    script: !include scripts.yaml
    scene: !include scenes.yaml
    
    # This is needed to run HA behind the cloudflared reverse
    # proxy
    http:
        use_x_forwarded_for: true
        trusted_proxies:
        - 127.0.0.1
    EOT
  # Export the config file to root of the repository
  filename = "../configuration.yaml"
}

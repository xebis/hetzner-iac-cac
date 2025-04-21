resource "hcloud_server" "demo" {
  count       = terraform.workspace == "production" ? 0 : 1
  name        = "${terraform.workspace}-demo"
  image       = "ubuntu-24.04"
  server_type = "cax11"
  user_data   = templatefile("${path.module}/cloud-config.yaml.tftpl", { ssh_id_pub = var.ssh_id_pub})

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

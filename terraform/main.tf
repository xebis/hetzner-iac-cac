resource "hcloud_server" "demo" {
  name        = "demo"
  image       = "ubuntu-24.04"
  server_type = "cax11"

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

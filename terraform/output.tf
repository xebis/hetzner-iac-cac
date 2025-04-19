output "ipv4_address" {
  value       = hcloud_server.demo[0].ipv4_address
  description = "Demo public IPv4 address"
}

output "ipv4_address" {
  value       = length(hcloud_server.demo) > 0 ? hcloud_server.demo[0].ipv4_address : ""
  description = "Demo public IPv4 address"
}

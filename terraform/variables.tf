variable "ssh_id_pub" {
  description = "SSH identity public key"
  type        = string
  validation {
    # RegEx source: https://stackoverflow.com/a/76661940/13659210
    condition     = can(regex("^ssh-(ed25519|rsa|dss|ecdsa) AAAA(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{4})( [^@]+@[^@]+)?$", var.ssh_id_pub))
    error_message = "Invalid SSH identity public key"
  }
}

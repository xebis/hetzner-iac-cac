terraform {
  required_version = ">= 0.13"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.50"
    }
  }

  backend "s3" {
    bucket               = "xebis-terraform"
    key                  = "terraform.tfstate"
    workspace_key_prefix = "hetzner-iac-cac"
    use_lockfile         = true # Set to false only for non-AWS S3 compatible APIs without "conditional object PUTs" capability

    # Only for non-AWS S3 compatible APIs
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "hcloud" {
}

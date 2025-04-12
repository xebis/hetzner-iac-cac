# Hetzner IaC CaC

GitOps-driven repo for provisioning Hetzner Cloud using Terraform and configuring it with Ansible.

## Features

- **Hetzner Cloud IaC** - Automate the provisioning and configuration of Hetzner Cloud infrastructure using Terraform.
- **GitOps Workflow** - Manage configurations via pull requests and automate updates using GitHub Actions.
- **Terraform** - Uses Terraform under the hood to apply changes efficiently.
- **Terraform State Management** - Stores Terraform state securely in AWS S3.

## Installation and Configuration

- Configure an AWS S3 bucket to store Terraform state files.
- Set up a Hetzner Cloud project and an API token with read-write permission.

> [!caution]
> The Hetzner Cloud project API token, S3 API credentials, Terraform state, GitHub repository secrets, and configuration code are key security elements.

### Set Up AWS S3 Bucket

Set up an AWS S3 bucket or a compatible storage service.

> [!important]
> Ensure you have the following details ready:
>
> - Bucket Name
> - Access Key ID
> - Secret Access Key
> - Region
> - S3 Endpoint URL (only required for non-AWS S3-compatible services)

### Set Up Hetzner Cloud Project

Set up a Hetzner Cloud project:

- Hetzner Cloud / *Project* / Security / API tokens
  - **Generate API token**
    - Description: *Your brief token description*
    - Permissions: Read & Write
    - **Generate API token**

> [!important]
> Ensure you have the following details ready:
>
> - Hetzner Cloud API Token

## Usage

One Hetzner Cloud server named `demo` is provisioned, updated, or decommissioned.

> [!note]
> All environments share one S3 bucket and one Hetzner Cloud project.

> [!note]
> The state is stored as JSON object `hetzner-iac-cac/<terraform workspace>/terraform.tfstate` in the bucket.

### Local Usage

Apply the configuration using Terraform:

```shell
export AWS_REGION=<aws-region>
export AWS_ENDPOINT_URL_S3=<aws-endpoint-url-s3> # Only for non-AWS S3 compatible APIs
export AWS_ACCESS_KEY_ID=<aws-access-key-id>
export AWS_SECRET_ACCESS_KEY=<aws-secret-access-key>

export HCLOUD_TOKEN=<hcloud-token>

terraform init
terraform plan
terraform apply
```

## Credits and Acknowledgments

- Martin Bružina - Author

## Copyright and Licensing

- MIT License  
  Copyright © 2025 Martin Bružina

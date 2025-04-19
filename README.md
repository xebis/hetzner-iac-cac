# Hetzner IaC CaC

GitOps-driven repo for provisioning Hetzner Cloud using Terraform and configuring it with Ansible.

## Features

- **Hetzner Cloud IaC** - Automate the provisioning and configuration of Hetzner Cloud infrastructure using Terraform.
- **GitOps Workflow** - Manage configurations via pull requests and automate updates using GitHub Actions and GitHub Environments.
- **Terraform** - Uses Terraform under the hood to apply changes efficiently.
- **Terraform State Management** - Stores Terraform state securely in AWS S3.

### Environments

- **Production**: Intentionally empty
- **Testing** and **Development**: One [Hetzner Server](https://docs.hetzner.com/cloud/servers/getting-started/creating-a-server/)

### Workflow

| Environment     | Event                            | Plan                        | Apply                       | Destroy                      |
| --------------- | -------------------------------- | --------------------------- | --------------------------- | ---------------------------- |
| **Production**  | `on.push.branches: main`         |                             | automatic or manual         | never, perpetual environment |
| **Testing**     | `on.pull_request.branches: main` | Pull Request comment        | automatic or manual         | on pull-request close/merge  |
| **Development** | manually at localhost            | [Local Usage](#local-usage) | [Local Usage](#local-usage) | [Local Usage](#local-usage)  |

> [!note]
> Automatic or manual apply depends on the environment protection rules set in the GitHub repository

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

### Set Up GitHub Repository

Set up GitHub actions, variables and secrets:

- GitHub / *Repository* / Settings
  - Actions / General
    - Workflow permissions: Read and write permissions
  - Environments
    - **New environment**
      - production
  - Secrets and variables / Actions / Actions secrets and variables
    - Secrets
      - **New repository secret**
        - `AWS_ACCESS_KEY_ID`
        - `AWS_SECRET_ACCESS_KEY`
        - `HCLOUD_TOKEN`
    - Variables
      - **New repository variable**
        - `AWS_ENDPOINT_URL_S3`
        - `AWS_REGION`

> [!note]
> Setting up GitHub environments is optional. Workflows can automatically create them with default settings if environments are not configured.

## Usage

**Production environment** is created on push events to the main branch. A Terraform plan is generated to a pull request comment, allowing for visibility and review before changes are applied. The apply step is manual, ensuring control over production changes. This environment is long-lived and never destroyed; it's considered a perpetual environment that must be maintained continuously.

**Testing environments** are ephemeral and manually approved, but the workflow is automatically prepared for each pull_request to the main branch. A Terraform plan is generated to a pull request comment. The apply step is manual, allowing skipping ephemeral environment where it's not necessary. Destruction is automated and tied to the lifecycle of the pull request-it is torn down as soon as the PR is closed or merged, ensuring resource cleanup.

**Development environments** are local and manually managed. You can create, plan, apply, and destroy these environments directly from the working directory using CLI, see [Local Usage](#local-usage).

> [!note]
> All environments share one S3 bucket and one Hetzner Cloud project.

One Hetzner Cloud server named `demo` is provisioned, updated, or decommissioned.

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

export ENVIRONMENT=development-$(hostname -f) # Creates terraform.tfstate object with workspace prefix in the name

# Create the environment
terraform -chdir=terraform init
terraform -chdir=terraform workspace select -or-create "${ENVIRONMENT}"

# Add your SSH key
sed -i "s|id_rsa\.pub|$(< ~/.ssh/id_rsa.pub)|" terraform/cloud-config.yaml

# Set up resources
terraform -chdir=terraform plan
terraform -chdir=terraform apply

# Test the environment
ssh -o StrictHostKeyChecking=no github@$(terraform -chdir=terraform output -raw ipv4_address)
exit

# Tear down resources
terraform -chdir=terraform destroy

# Delete the environment
terraform -chdir=terraform workspace select "default"
terraform -chdir=terraform workspace delete "${ENVIRONMENT}"

# Clean up
sed -i "s|$(< ~/.ssh/id_rsa.pub)|id_rsa\.pub|" terraform/cloud-config.yaml
```

## Credits and Acknowledgments

- Martin Bružina - Author

## Copyright and Licensing

- MIT License  
  Copyright © 2025 Martin Bružina

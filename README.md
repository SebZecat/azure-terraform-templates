# azure-terraform-templates
Azure Terraform

## Structure

- main.tf: main configuration file
- variables.tf: defines variables
- variables.tfvars: variables intended to be changed by the user
- modules/db-install/scripts/: scripts used in the project
- install_mariadb.sh: installation and configuration of MariaDB for the DB servers
- playbook.yml: ansible playbook for web server configuration

## Instructions

### Prerequisites

- Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for Windows choose AMD64.
- Azure account with required rights for Terraform.
- Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) and authenticate with `az login`.

### Download

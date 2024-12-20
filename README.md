# Azure Terraform Template
Azure Terraform

## Structure

- main.tf: main configuration file
- variables.tf: defines variables
- variables.tfvars: variables intended to be changed by the user
- modules/db-install/scripts/: scripts used in the project
- install_mariadb.sh: installation and configuration of MariaDB for the DB servers
- playbook.yml: ansible playbook for web server configuration

## Instructions for setup

### Prerequisites

- Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli), for Windows choose AMD64.
- Azure account with required rights for Terraform.
- Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) and authenticate with `az login`.

### Download and setup

#### 1. Download
- Download the project as zip and extract.
#### 2. Changes
- Make necessary changes in **`variables.tfvars`**
- Changes that must be made manually:
  - Lines 6, 7 in **`modules/db-install/scripts/install_mariadb.sh`** must have equal value to `admin_username` and `admin_password` in **`terraform.tfvars`**
  - Lines 64, 65 in **`modules/db-install/scripts/playbook.yml`** must have equal value to `admin_username` and `admin_password` in **`terraform.tfvars`**
#### 3. Run Terraform via Powershell
- You may not be able to log in with `az login`, but then you follow the instructions that appear in Powershell.
  ```powershell
  cd <the path to the Terraform folder>
  az login
  terraform init
  terraform plan -out main.tfplan
  terraform apply main.tfplan
  ```
- You may get an error message related to MariaDB installation, but then you can delete the resources in Azure and try to run Terraform again.
#### 4. Use the Project
- Type the public IP address that is in `web_vm_public_ip = "<IP address>"` which appears in outputs in a browser to show the website that has contact with the database.
  - It may take some time before the website that retrieves data from the database is fully set up.
- Write `terraform output admin_password` to display the password of the admin user.
- To connect to the web server via SSH:
  ```powershell
  ssh <admin_username>@<public IP address>
  <admin_username>@<public IP address> password: <admin_password>
  ```
- To connect to the DB servers via SSH from the web server:
  ```powershell
  ssh <admin_username>@<IP address of the VM>
  <admin_username>@<IP address of the VM> password: <admin_password>
  ```
#### 5. **Eliminate Resources After Setup**
- Plan and apply destroy for the project:
  ```powershell
  terraform plan -destroy -out main.destroy.tfplan
  terraform apply main.destroy.tfplan
  ```

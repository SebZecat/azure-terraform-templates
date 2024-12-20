location            = "Norway East" # Set to a suitable location, this is just an example
resource_group_name = "myResourceGroup1" # Set a suitable name
admin_username      = "adminuser" # Set to a suitable username (must be changed to equal value in playbook.yml and install_mariadb.sh, see README.md)
admin_password = "Password123" # Set a suitable password (must be changed to equal value in playbook.yml and install_mariadb.sh, see README.md)

# VM sizes
web_vm_size = "Standard_B1s"
db_vm_size  = "Standard_B1ms"
install_script_url = "mariadbinstall5"

# Network
vnet_name = "vnet" # The name of the virtual network
address_space = ["10.0.0.0/16"] # Change to what will be used, this is just an example
db_subnet_prefix = "10.0.0.0/24" # Change to what will be used
web_subnet_prefix = "10.0.1.0/24" # Change to what will be used

# VM
web_vm_name = "web-server"
/*web_script_url = "https://mariadbinstall.blob.core.windows.net/play/playbook.yml"*/
vm_count = 2
db_vm_name = "db-server"
/*db_script_url = "https://mariadbinstall.blob.core.windows.net/install/install_mariadb.sh"*/

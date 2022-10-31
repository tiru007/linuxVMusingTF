# terra-demo-vm
Deploy azure linux virtual machine with static private IP using terraform

# Steps to run
clone the repository
https://github.com/tiru007/linuxVMusingTF

Browse to directory, where you have downloaded the repository

# Run terraform init to initialize the Terraform deployment. This command downloads the Azure modules required to manage your Azure resources.
> terraform init

# Run terraform plan to create an execution plan.
> terraform.exe plan -var-file="vars.tfvars" -out main.tfplan

# Run terraform apply to apply the execution plan to your cloud infrastructure.
> terraform apply main.tfplan

# Run terraform output to get the virtual machine public IP address.
> terraform output public_ip_address

# Use SSH to connect to the virtual machine.
> ssh -i id_rsa linuxadmin@<public_ip_address>


# Steps to Cleanup

# Run terraform plan and specify the destroy flag.
> terraform plan -destroy -var-file="vars.tfvars" -out main.destroy.tfplan

# Run terraform apply to apply the execution plan.
> terraform apply main.destroy.tfplan

Troubleshoot Terraform on Azure
> https://learn.microsoft.com/en-us/azure/developer/terraform/troubleshoot

Authenticate Terraform to Azure
> https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?source=recommendations&tabs=bash

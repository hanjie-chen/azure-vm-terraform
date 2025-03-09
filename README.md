# azure-vm-terraform

terraform code 用于创建 Azure VM

再也不用在Azure portal上面手动创建了，哈哈哈哈

reference https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli

# furture consider
1/ use terraform moudle to refactor the existing code
2/ for vm created, try to build enviroment
3/ for terraform.tfstate can't store in the local, if it the file loss, the terraform will not regonize the Azure env.
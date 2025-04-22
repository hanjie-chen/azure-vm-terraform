# azure-vm-terraform

terraform code 用于创建 Azure VM

再也不用在Azure portal上面手动创建了，哈哈哈哈

reference https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli

# furture consider
1/ use terraform module to refactor the existing code
2/ for vm created, try to build enviroment, for example in windows install vscode, chrome, windows termianl .. etc
in linux install docker, python (virtual env), terraform ... etc
3/ for terraform.tfstate can't store in the local, if it the file loss, the terraform will not regonize the Azure env.
4/ when use terraform build the windows virutal machine change rdp port to another port not use 3389 port.\
5/ optimization the comment, make the content more clear

# how to use the repo
在 terraform apply 之前需要创建一个 terraform.tfvars 并且在其中定义：

```hcl
subscription_id = "XXX"

linux_vm_admin_password = "XXX"

windows_vm_admin_password = "XXX"
```
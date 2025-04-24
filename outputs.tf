# output.tf

# output for linux vm
output "linux_vm_public_ip" {
  value = module.linux_vm.linux_vm_public_ip
}

output "linux_vm_private_ip" {
  value = module.linux_vm.linux_vm_private_ip
}


# output for windows vm
output "windows_vm_public_ip" {
  value = module.windows_vm.windows_vm_public_ip
}

output "windows_vm_private_ip" {
  value = module.windows_vm.windows_vm_private_ip
}
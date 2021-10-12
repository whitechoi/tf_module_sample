# output

output "id" {
  value = module.bastion.id
}

output "key_name" {
  value = module.bastion.key_name
}

output "private_ip" {
  value = module.bastion.private_ip
}

output "public_ip" {
  value = module.bastion.public_ip
}

output "bastion_sg_id" {
  value = module.bastion.bastion_sg_id
}
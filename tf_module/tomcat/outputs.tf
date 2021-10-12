# output

output "name" {
  value = module.tomcat.name
}

output "private_ip" {
  value = module.tomcat.private_ip
}

#output "public_ip" {
#  value = module.tomcat.public_ip
#}

output "lb_dns_name" {
  value = module.tomcat.lb_dns_name
}

output "tomcat_sg_id" {
  value = module.tomcat.tomcat_sg_id
}

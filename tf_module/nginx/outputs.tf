# output

output "name" {
  value = module.nginx.name
}

output "private_ip" {
  value = module.nginx.private_ip
}

output "lb_dns_name" {
  value = module.nginx.lb_dns_name
}

output "nginx_sg_id" {
  value = module.nginx.nginx_sg_id
}
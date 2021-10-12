# output

output "name" {
  value = var.name
}

output "key_name" {
  value = aws_instance.this.key_name
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

#output "public_ip" {
#  value = aws_eip.this.public_ip
#}

output "lb_dns_name" {
  value = aws_alb.this.dns_name
}

output "tomcat_sg_id" {
  value = aws_security_group.this.id
}

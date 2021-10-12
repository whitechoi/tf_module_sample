# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "tomcat"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "private_subnet_ids" {
  default = ""
}

variable "public_subnet_ids" {
  default = ""
}

variable "allow_ip_address_web" {
  type = list(string)
  default = [
    "10.10.0.0/16"
  ]
}

variable "allow_ip_address_lb" {
  type = list(string)
  default = [
    "211.60.50.190/32","10.10.0.0/16"
  ]
}

variable "key_name" {
  default = "cystest-mz"
}

data "template_file" "setup" {
  template = file("template/setup.sh")

  vars = {
    HOSTNAME = var.name
  }
}



# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "cys-terraform-jenkins"
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

variable "jenkins_version" {
  default = "2"
}

variable "allow_ip_address" {
  type = list(string)
  default = [
    "0.0.0.0/0", # all
    # "221.148.35.250/32", # echo "$(curl -sL icanhazip.com)/32"
  ]
}

variable "key_name" {
  default = "cystest"
}

variable "dns_name" {
  default = ""
}

variable "dns_root" {
  default = ""
}

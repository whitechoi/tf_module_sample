# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "tf-cys"
}

variable "vpc_id" {
  default = ""
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "single_route_table" {
  default = true
}

variable "enable_nat_gateway" {
  default = true
}

variable "single_nat_gateway" {
  default = true
}

variable "one_nat_gateway_per_az" {
  default = false
}

variable "enable_dns_hostnames" {
  default = true
}

variable "tags" {
  default = {
    "ENV" = "terraform-mgmt"
  }
}
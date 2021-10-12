# variable

variable "name" {
  description = "Name of the cluster, e.g: demo"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "public_subnet_ids" {
  default = []
}

variable "load_balancer_type" {
  default = "application"
}

variable "internal" {
  default = false
}

variable "allow_ip_address_was" {
  type    = list(string)
  default = []
}

variable "allow_ip_address_lb" {
  type    = list(string)
  default = []
}

variable "ami_id" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "volume_id" {
  default = ""
}

variable "delete_on_termination" {
  default = true
}

variable "volume_type" {
  default = "gp2"
}

variable "volume_size" {
  default = "8"
}

variable "key_name" {
  default = ""
}

variable "key_path" {
  default = ""
}

variable "user_data" {
  default = ""
}

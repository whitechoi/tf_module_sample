# variable

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-cys"
    key    = "vpc.tfstate"
  }
}

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "bastion"
}

variable "administrator" {
  default = true
}

variable "allow_ip_address" {
  type = list(string)
  default = [
    "0.0.0.0/0",
    # "106.244.127.8/32", # echo "$(curl -sL icanhazip.com)/32"
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



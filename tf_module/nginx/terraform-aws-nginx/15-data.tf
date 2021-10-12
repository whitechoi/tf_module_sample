# data
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-cys"
    key    = "vpc.tfstate"
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-cys"
    key    = "bastion.tfstate"
  }
}

data "terraform_remote_state" "tomcat" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-cys"
    key    = "tomcat.tfstate"
  }
}

data "aws_ami" "this" {
  most_recent = true

  owners = ["137112412989"] # AWS's account ID.

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}


data "template_file" "setup" {
  template = file("${path.module}/template/setup.sh")
  
  vars = {
    WAS_DNS = "${data.terraform_remote_state.tomcat.outputs.lb_dns_name}"
  }
}

#data "template_file" "nginx_conf" {
#  template = file("${path.module}/template/nginx.conf")
#  
#  vars = {
#    WAS_DNS = "${data.terraform_remote_state.tomcat.outputs.lb_dns_name}"
#  }
#}

# data
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-cys-0131"
    key    = "cys-terraform-vpc.tfstate"
  }
}

data "aws_ami" "this" {
  most_recent = true

  owners = ["137112412989"] # AWS's account ID.
  # owners = ["979382823631"] # Bitnami's account ID.

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
    # values = ["bitnami-jenkins-*"]
  }
}

data "template_file" "setup" {
  template = file("${path.module}/template/setup.sh")

}

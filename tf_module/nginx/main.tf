terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-cys"
    key            = "nginx.tfstate"
    dynamodb_table = "terraform-cys"
    encrypt        = true
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}


module "nginx" {

  source = "./terraform-aws-nginx"

  name = var.name

  vpc_id = var.vpc_id

  subnet_id = var.subnet_id

  public_subnet_ids = var.public_subnet_ids

  allow_ip_address_was = var.allow_ip_address_was
  
  allow_ip_address_lb = var.allow_ip_address_lb
  
  #user_data = "sed -i 's/127.0.0.1:8080;/${data.terraform_remote_state.tomcat.outputs.lb_dns_name};/g' /etc/nginx/nginx.conf"

  key_name = var.key_name

}





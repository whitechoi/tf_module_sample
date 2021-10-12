terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-cys"
    key            = "tomcat.tfstate"
    dynamodb_table = "terraform-cys"
    encrypt        = true
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}


module "tomcat" {

  source = "./terraform-aws-tomcat"

  name = var.name

  vpc_id = var.vpc_id

  subnet_id = var.subnet_id

  public_subnet_ids = var.public_subnet_ids

  allow_ip_address_web = var.allow_ip_address_web
  
  allow_ip_address_lb = var.allow_ip_address_lb
  
  user_data = data.template_file.setup.rendered

  key_name = var.key_name

}





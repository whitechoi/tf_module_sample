terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-cys-0131"
    key            = "cys-terraform-vpc.tfstate"
    dynamodb_table = "terraform-cys-0131"
    encrypt        = true
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}


module "vpc" {
  source = "./terraform-aws-vpc"

  region = var.region
  name   = var.name

  vpc_id   = var.vpc_id
  vpc_cidr = var.vpc_cidr

  single_route_table = var.single_route_table

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets

  tags = var.tags
}


terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-cys"
    key            = "vpc.tfstate"
    dynamodb_table = "terraform-cys"
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
  name   = "${var.name}-vpc"

  vpc_id   = var.vpc_id
  vpc_cidr = var.vpc_cidr

  single_route_table = var.single_route_table

  #NAT Gateway Scenarios
  # One NGW per subnet : enable_nat_gateway = true
  #                               single_nat_gateway = false
  #                               one_nat_gateway_per_az = false
  
  # Single NGW : enable_nat_gateway = true
  #              single_nat_gateway = true
  #              one_nat_gateway_per_az = false

  # One NGW per az : enable_nat_gateway = true
  #                  single_nat_gateway = false
  #                  one_nat_gateway_per_az = true
  
  #This is Single NGW
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  
  #AZ is A, C
  public_subnets  = [local.public_subnets[0], local.public_subnets[1]]
  private_subnets = [local.private_subnets[0], local.private_subnets[1]]

  tags = var.tags
}


# Terraform Main

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-cys-0131"
    key    = "cys-terraform-s3-resize.tfstate"
    dynamodb_table = "terraform-cys-0131"
    encrypt        = true
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "dev-lambda" {
  source = "./terraform-aws-lambda-s3"
  region = var.region

  name        = var.name
  stage       = var.stage
  description = "s3 > lambda > resize"
  runtime     = "nodejs10.x"
  handler     = "index.handler"
  memory_size = 512
  timeout     = 5
  s3_bucket   = var.s3_bucket
  s3_source   = "target/lambda.zip"
  s3_key      = "lambda/${var.name}/${var.name}-${var.build_no}.zip"

  source_bucket = var.SOURCE_BUCKET
  filter_prefix = "origin/"
  filter_suffix = ""

  env_vars = {
    PROFILE = var.stage
  }
}

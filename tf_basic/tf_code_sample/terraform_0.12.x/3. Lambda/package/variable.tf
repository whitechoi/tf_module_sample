# variable

data "aws_caller_identity" "current" {
}

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default     = "demo"
}

variable "stage" {
  default     = "dev"
}

variable "timeout" {
  type        = string
  default     = "30"
}

variable "s3_bucket" {
  type        = string
  default     = "terraform-cys-s3-resize"
}

variable "s3_source" {
  type        = string
  default     = "package/lambda.zip"
}

variable "s3_key" {
  type        = string
  default     = "package/lambda.zip"
}


variable "description" {
  default     = ""
}

variable "runtime" {
  default = "nodejs12.x"
}

variable "handler" {
  default     = "index.handler"
}

variable "memory_size" {
  default     = "512"
}

variable "env_vars" {
  type        = map(string)
  default = {
    "PROFILE" = "dev",
  }
  
}

variable "source_bucket" {
  default = "tf-cys-source"
}

variable "filter_prefix" {
  default = "origin/"
}

variable "filter_suffix" {
  default = ""
}

variable "build_no" {
  default = "0"
}
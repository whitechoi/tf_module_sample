# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "s3-resize"
}

variable "stage" {
  default = "dev"
}

variable "s3_bucket" {
  default = "terraform-cys-s3-resize"
}

variable "build_no" {
  default = "0"
}

variable "SOURCE_BUCKET" {
  default = "terraform-cys-s3-resize-source"
}

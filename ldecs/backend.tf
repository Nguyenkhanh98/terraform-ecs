terraform {
  backend "s3" {
    bucket         = "onair-tf"
    key            = "prod/terraformld.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
  }
}
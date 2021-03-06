provider "aws" {
  region  = "ap-northeast-1"
  profile = "12341234_AdministratorAccess"
}
terraform {
  required_version = "~> 0.14.3"

  backend "s3" {
    bucket  = "my-sandbox-tfstate"
    region  = "ap-northeast-1"
    key     = "terraform.state"
    profile = "12341234_AdministratorAccess"
  }
}

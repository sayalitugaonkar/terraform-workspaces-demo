
terraform {
  backend "s3" {
    bucket                  = "sayali-tf-bucket"
    key                     = "tf-infra/terraform.tfstate"
    region                  = "ap-south-1"
    shared_credentials_file = "/home/sayali/Documents/terraform/project-1/credentials"
    profile                 = "testing"
  }
}

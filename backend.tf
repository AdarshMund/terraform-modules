terraform {
  backend "s3" {
    bucket         = "adarsh-terraform-state-bucket"
    key            = "project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-work"
    key    = "terraform-vpc-seoul/terraform.tfstate"
    region = "ap-south-2"
  }
}

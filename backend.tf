terraform {
  backend "s3" {
    bucket  = "tf-state-practices"
    key     = "apps/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    profile = "personal"
  }
}

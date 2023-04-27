terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "personal"
#   [personal]
# aws_access_key_id = AKIARSHXNS6YAIT2CXUX
# aws_secret_access_key = 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
}
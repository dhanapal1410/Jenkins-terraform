terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "AKIASMWR35P743GE34U4"
  secret_key = "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"
}


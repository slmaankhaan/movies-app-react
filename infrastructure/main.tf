//provider

provider "aws" {
  region = "us-east-1"
}

//Backend

terraform {
  backend "s3" {
    bucket  = "screenplays-tf"
    key     = "app-screenplays-tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

//Local proporties

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Salman Khan "
  }
}

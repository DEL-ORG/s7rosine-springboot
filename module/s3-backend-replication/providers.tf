terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  alias  = "source-region"
  region = var.aws_source_region
}

provider "aws" {
  alias  = "destination-region"
  region = var.aws_destination_region 
}

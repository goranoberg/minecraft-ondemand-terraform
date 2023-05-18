terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "Source" = "minecraft-ondemand-terraform"
      "MineCraft" = format("minecraft.%s", var.domain_name)
    }
  }
}

# Configure Provider for CloudWatch since only us-east-1 is supported
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  default_tags {
    tags = {
      "Source" = "minecraft-ondemand-terraform"
      "MineCraft" = format("minecraft.%s", var.domain_name)
    }
  }
}
provider "aws" {
  region = var.region
}

terraform {
  cloud {
    organization = "optimus_prime"

    workspaces {
      name = "demo_prime"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98.0"
    }
  }
}

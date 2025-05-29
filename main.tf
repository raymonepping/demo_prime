provider "aws" {
  region = "eu-north-1"
}

terraform {
  cloud {
    organization = "optimus_prime"

    workspaces {
      name = "aws_demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98.0"
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "optimus_prime"
    workspaces = {
      name = "demo_optimus"
    }
  }
}

module "compute" {
  source            = "app.terraform.io/optimus_prime/optimus/aws//modules/compute"
  vm_count          = 1
  ami_id            = var.ami_id
  instance_type     = "t3.micro"

  subnet_id         = data.terraform_remote_state.network.outputs.subnet_id
  security_group_id = data.terraform_remote_state.network.outputs.sg_id
  name              = "prime-vm"
  key_name          = var.key_name
  public_key        = var.public_key
  project_name      = var.project_name
  volume_size       = 10
  volume_type       = "gp3"
}

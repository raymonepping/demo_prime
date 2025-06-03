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

data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "optimus_prime"
    workspaces = {
      name = "demo_optimus"
    }
  }
}

# This module creates EC2 instances based on the selected OS and configuration.
module "compute" {
  source            = "app.terraform.io/optimus_prime/optimus/aws//modules/compute"
  name              = "prime-vm"

  vm_count          = var.vm_count

  ami_id            = var.os_map[var.selected_os].ami_id
  instance_type     = var.os_map[var.selected_os].instance_type
  volume_size       = var.os_map[var.selected_os].disk_size
  volume_type       = var.os_map[var.selected_os].disk_type

  subnet_id         = data.terraform_remote_state.network.outputs.subnet_id
  security_group_id = data.terraform_remote_state.network.outputs.security_group_id
  
  key_name          = var.key_name
  public_key        = var.public_key
  project_name      = var.project_name

}
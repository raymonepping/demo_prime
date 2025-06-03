variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "vm_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}
variable "ami_id" {
  description = "AMI ID to use"
  type        = string
}

variable "selected_os" {
  description = "Operating system to be used for AWS instances"
  type        = string
  default     = "ubuntu"
}

variable "os_map" {
  description = "Map of OS configurations"
  type = map(object({
    ami_id        = string
    instance_type = string
    disk_size     = number
    disk_type     = string
  }))
  default = {
    ubuntu = {
      ami_id        = "ami-0c1ac8a41498c1a9c"
      instance_type = "t3.micro"
      disk_size     = 8
      disk_type     = "gp3"
    }
    redhat = {
      ami_id        = "ami-0989038dff76173d3"
      instance_type = "t3.micro"
      disk_size     = 10
      disk_type     = "gp3"
    }
    suse = {
      ami_id        = "ami-0b51644a15afa2ea8"
      instance_type = "t3.micro"
      disk_size     = 10
      disk_type     = "gp3"
    }
  }
}

variable "key_name" {
  description = "AWS Key pair name"
  type        = string
}

variable "public_key" {
  description = "Public key for SSH access"
  type        = string
}

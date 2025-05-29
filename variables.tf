variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "vm_count" {
  description = "How many EC2 instances to create"
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

variable "subnet_id" {}
variable "security_group_id" {}
variable "name" {}
variable "key_name" {}
variable "public_key" {}
variable "volume_size" {}
variable "volume_type" {}

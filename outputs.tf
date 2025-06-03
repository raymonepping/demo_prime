output "public_ips" {
  description = "Public IP addresses of the created instances"
  value       = module.compute.public_ips
}

output "instance_ids" {
  description = "Instance IDs of the created instances"
  value       = module.compute.instance_ids
}

output "selected_os_configuration" {
  description = "Current OS configuration used for deployment"
  value       = var.os_map[var.selected_os]
}

output "vm_count_confirmed" {
  description = "Confirmed count of deployed EC2 instances"
  value       = length(module.compute.instance_ids)
}

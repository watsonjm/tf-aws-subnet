output "subnet_ids" {
  value = values(aws_subnet.subnet)[*].id
}
output "subnets_all_info" {
  value = values(aws_subnet.subnet)[*]
}
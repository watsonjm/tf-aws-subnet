output "subnet_ids" {
  value = values(aws_subnet.subnet)[*].id
}
output "subnet_cidrs" {
  value = values(aws_subnet.subnet)[*].cidr_block
}
output "subnets_all_info" {
  value = values(aws_subnet.subnet)[*]
}
output "subnet_ids" {
  value = values(aws_subnet.subnet)[*].id
}
resource "aws_subnet" "subnet" {
  for_each                = toset(var.cidr)
  vpc_id                  = var.vpc_id
  availability_zone_id    = var.az_ids[index(var.cidr, each.key)]
  cidr_block              = each.key
  map_public_ip_on_launch = var.map_public_ip_on_launch

  lifecycle {
    ignore_changes = [tags]
  }

  tags = merge(var.tags, { Name = "${var.name}${index(var.cidr, each.key) + 1}" })
}

resource "aws_route_table_association" "association" {
  for_each       = aws_subnet.subnet
  subnet_id      = each.value.id
  route_table_id = var.rt_id
}
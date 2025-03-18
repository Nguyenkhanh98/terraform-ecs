resource "aws_eip" "nat" {
  count = length(var.subnet_ids)
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat" {
  count = length(var.subnet_ids)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.subnet_ids[count.index]

  tags = {
    Name = "nat-gateway-${var.availability_zones[count.index]}"
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
}


resource "aws_route" "nat_gateway_route" {
  count = length(var.subnet_ids)

  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
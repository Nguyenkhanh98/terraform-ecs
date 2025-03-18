

resource "aws_nat_gateway" "nat" {

  allocation_id = "eipalloc-0b3455fba59c6f0eb"
  subnet_id     = var.subnet_ids[0]

  tags = {
    Name = "nat-gateway"
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

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_rt.id
}
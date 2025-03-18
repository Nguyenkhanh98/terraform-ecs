

resource "aws_nat_gateway" "nat" {

  allocation_id = "eipalloc-0b3455fba59c6f0eb"
  subnet_id     = var.subnet_ids[0]

  tags = {
    Name = "nat-gateway"
  }
}

data "aws_route_table" "existing_route" {
  route_table_id = "rtb-0ffa223b7e59c84f2"
   destination_cidr_block = "0.0.0.0/0"
}


resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
}


resource "aws_route" "nat_gateway_route" {
  route_table_id         =  data.aws_route_table.existing_route.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id

  depends_on = [data.aws_route_table.existing_route]
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_rt.id
}
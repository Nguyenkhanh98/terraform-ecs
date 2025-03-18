resource "aws_subnet" "private" {
  count = length(var.private_subnet_ids)

  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_ids[count.index]
  availability_zone = var.private_subnet_ids[count.index]

  tags = {
    Name = "private-subnet-${var.private_subnet_ids[count.index]}"
  }
}

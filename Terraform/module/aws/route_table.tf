resource "aws_route_table" "fastfood_route_table_public" {
  vpc_id = aws_vpc.fastfood_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fastfood_internet_gateway.id
  }

  tags = {
    Name = "fastfood-route-table-public"
  }
}

resource "aws_route_table_association" "assoc_subnet_public_1" {
  subnet_id      = aws_subnet.fastfood_subnet_public_1.id
  route_table_id = aws_route_table.fastfood_route_table_public.id
}

resource "aws_route_table_association" "assoc_subnet_public_2" {
  subnet_id      = aws_subnet.fastfood_subnet_public_2.id
  route_table_id = aws_route_table.fastfood_route_table_public.id
}

resource "aws_route_table" "fastfood_route_table_private" {
  vpc_id = aws_vpc.fastfood_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.fastfood_nat_gateway.id
  }

  tags = {
    Name = "fastfood-route-table-private"
  }
}

resource "aws_route_table_association" "assoc_subnet_private_1" {
  subnet_id      = aws_subnet.fastfood_subnet_private_1.id
  route_table_id = aws_route_table.fastfood_route_table_private.id
}

resource "aws_route_table_association" "assoc_subnet_private_2" {
  subnet_id      = aws_subnet.fastfood_subnet_private_2.id
  route_table_id = aws_route_table.fastfood_route_table_private.id
}
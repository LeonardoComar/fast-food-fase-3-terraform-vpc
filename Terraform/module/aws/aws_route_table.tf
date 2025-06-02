resource "aws_route_table" "fastfood_route_table_publica" {
  vpc_id = aws_vpc.fastfood_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fastfood_internet_gateway.id
  }

  tags = {
    Name = "fastfood-route-table-publica"
  }
}

resource "aws_route_table_association" "assoc_subnet_publica_1" {
  subnet_id      = aws_subnet.fastfood_subnet_publica_1.id
  route_table_id = aws_route_table.fastfood_route_table_publica.id
}

resource "aws_route_table_association" "assoc_subnet_publica_2" {
  subnet_id      = aws_subnet.fastfood_subnet_publica_2.id
  route_table_id = aws_route_table.fastfood_route_table_publica.id
}

resource "aws_route_table" "fastfood_route_table_privada" {
  vpc_id = aws_vpc.fastfood_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.fastfood_nat_gateway.id
  }

  tags = {
    Name = "fastfood-route-table-privada"
  }
}

resource "aws_route_table_association" "assoc_subnet_privada_1" {
  subnet_id      = aws_subnet.fastfood_subnet_privada_1.id
  route_table_id = aws_route_table.fastfood_route_table_privada.id
}

resource "aws_route_table_association" "assoc_subnet_privada_2" {
  subnet_id      = aws_subnet.fastfood_subnet_privada_2.id
  route_table_id = aws_route_table.fastfood_route_table_privada.id
}
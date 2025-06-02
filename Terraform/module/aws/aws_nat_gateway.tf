resource "aws_nat_gateway" "fastfood_nat_gateway" {
  allocation_id = aws_eip.fastfood_nat_eip.id
  subnet_id     = aws_subnet.fastfood_subnet_publica_1.id

  tags = {
    Name = "fastfood-nat-gateway"
  }
}
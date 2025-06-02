resource "aws_internet_gateway" "fastfood_internet_gateway" {
  vpc_id = aws_vpc.fastfood_vpc.id

  tags = {
    Name = "fastfood-internet-gateway"
  }
}

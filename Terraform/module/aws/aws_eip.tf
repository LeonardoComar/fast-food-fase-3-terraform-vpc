resource "aws_eip" "fastfood_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "fastfood-nat-eip"
  }

  depends_on = [aws_internet_gateway.fastfood_internet_gateway]
}
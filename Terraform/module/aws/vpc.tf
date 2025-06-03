resource "aws_vpc" "fastfood_vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "fastfood-vpc"
  }
}

resource "aws_subnet" "fastfood_subnet_public_1" {
  vpc_id                  = aws_vpc.fastfood_vpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "fastfood-subnet-public-1"
    Type = "public"
  }
}

resource "aws_subnet" "fastfood_subnet_public_2" {
  vpc_id                  = aws_vpc.fastfood_vpc.id
  cidr_block              = "10.1.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "fastfood-subnet-public-2"
    Type = "public"
  }
}

resource "aws_subnet" "fastfood_subnet_private_1" {
  vpc_id            = aws_vpc.fastfood_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "fastfood-subnet-private-1"
    Type = "private"
  }
}

resource "aws_subnet" "fastfood_subnet_private_2" {
  vpc_id            = aws_vpc.fastfood_vpc.id
  cidr_block        = "10.1.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "fastfood-subnet-private-2"
    Type = "private"
  }
}

resource "aws_security_group" "fastfood_security_group" {
  name        = "fastfood-security-group"
  description = "Security group de acesso geral"
  vpc_id      = aws_vpc.fastfood_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fastfood-security-group"
  }
}

resource "aws_eip" "fastfood_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "fastfood-nat-eip"
  }

  depends_on = [aws_internet_gateway.fastfood_internet_gateway]
}
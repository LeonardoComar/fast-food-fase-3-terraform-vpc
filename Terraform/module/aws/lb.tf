resource "aws_lb" "fastfoodapi_lb" {
  name               = "fastfoodapi-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.fastfood_security_group.id]
  subnets = [
    aws_subnet.fastfood_subnet_public_1.id,
    aws_subnet.fastfood_subnet_public_2.id
  ]
  idle_timeout = 60

  tags = {
    Name = "fastfoodapi-lb"
  }
}
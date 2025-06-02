output "fastfood_vpc" {
  value = aws_vpc.fastfood_vpc.id
}

output "fastfood_subnet_publica_ids" {
  value = [
    aws_subnet.fastfood_subnet_publica_1.id,
    aws_subnet.fastfood_subnet_publica_2.id
  ]
}

output "fastfood_subnet_privada_ids" {
  value = [
    aws_subnet.fastfood_subnet_privada_1.id,
    aws_subnet.fastfood_subnet_privada_2.id
  ]
}

output "fastfood_security_group" {
  value = aws_security_group.fastfood_security_group.id
}

output "fastfoodapi_lb" {
  value = aws_lb.fastfoodapi_lb.dns_name
}
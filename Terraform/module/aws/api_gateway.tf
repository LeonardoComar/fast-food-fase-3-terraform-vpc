resource "aws_api_gateway_rest_api" "fastfoodapi_api" {
  name        = "fastfoodapi-api"
  description = "API para expor a aplicação fastfoodapi via API Gateway"
}

resource "aws_api_gateway_resource" "fastfoodapi_resource" {
  rest_api_id = aws_api_gateway_rest_api.fastfoodapi_api.id
  parent_id   = aws_api_gateway_rest_api.fastfoodapi_api.root_resource_id
  path_part   = "fastfoodapi"
}

resource "aws_api_gateway_authorizer" "cognito_authorizer" {
  name            = "CognitoAuthorizer"
  rest_api_id     = aws_api_gateway_rest_api.fastfoodapi_api.id
  type            = "COGNITO_USER_POOLS"
  provider_arns   = [aws_cognito_user_pool.fastfood_user_pool.arn]
  identity_source = "method.request.header.Authorization"
}

resource "aws_api_gateway_method" "fastfoodapi_method" {
  rest_api_id   = aws_api_gateway_rest_api.fastfoodapi_api.id
  resource_id   = aws_api_gateway_resource.fastfoodapi_resource.id
  http_method   = "ANY"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito_authorizer.id
}

resource "aws_internet_gateway" "fastfood_internet_gateway" {
  vpc_id = aws_vpc.fastfood_vpc.id

  tags = {
    Name = "fastfood-internet-gateway"
  }
}

resource "aws_nat_gateway" "fastfood_nat_gateway" {
  allocation_id = aws_eip.fastfood_nat_eip.id
  subnet_id     = aws_subnet.fastfood_subnet_public_1.id

  tags = {
    Name = "fastfood-nat-gateway"
  }
}

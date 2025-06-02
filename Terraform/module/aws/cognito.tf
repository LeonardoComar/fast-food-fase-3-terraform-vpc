resource "aws_cognito_user_pool" "fastfood_user_pool" {
  name = "fastfoodapi-user-pool"

  schema {
    name                     = "jwtToken"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = false
  }
}

resource "aws_cognito_user_pool_client" "fastfood_user_pool_client" {
  user_pool_id    = aws_cognito_user_pool.fastfood_user_pool.id
  name            = "UserPoolTokens"
  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]

  read_attributes  = ["custom:jwtToken"]
  write_attributes = ["custom:jwtToken"]
}
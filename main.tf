resource "aws_cognito_user_pool_domain" "domainpool" {
  domain       = var.domain_name
  user_pool_id = aws_cognito_user_pool.userpool.id
}

resource "aws_cognito_user_pool" "userpool" {
  name                     = var.pool_user_name
  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]
  ############# attributes #############
  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = var.schema_attribute_emial_required
  }
  ########## password policy ############
  password_policy {
    minimum_length    = var.password_lentgth
    require_lowercase = var.require_lowercase
    require_numbers   = var.password_require_numbers
    require_symbols   = var.password_require_symbols
    require_uppercase = var.require_uppercase
  }


  verification_message_template {
    default_email_option = "CONFIRM_WITH_LINK"
    email_subject        = "Account Confirmation"
    email_message        = "Your confirmation code is {####}"
  }
  tags = {
    name        = var.cognito_tag_name
    Environment = var.environment_types
    Managed_by  = var.infra_managed_by
    Project     = var.project_name

  }

}

resource "aws_cognito_user_pool_client" "userpool_client" {
  name                                 = var.clinet_name
  user_pool_id                         = aws_cognito_user_pool.userpool.id
  callback_urls                        = [var.callback_urls]
  logout_urls                          = [var.logout_urls]
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]
  supported_identity_providers         = ["COGNITO"]
}


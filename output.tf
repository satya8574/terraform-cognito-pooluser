# output "user_pool_id" {
#   value = aws_cognito_user_pool.userpool.id
# }


# output "user_pool" {
# description = "The full `aws_cognito_user_pool` object."
#   value       = module.cognito_user_pool.user_pool
# }
output "client_ids" {
  description = "The ids of the user pool clients"
  value       = aws_cognito_user_pool_client.userpool_client.id
}
output "client_secrets" {
  description = " The client secrets of the user pool clients"
  value       = aws_cognito_user_pool_client.userpool_client.id
  sensitive   = true
}
output "domain_aws_account_id" {
  description = "The AWS account ID for the user pool owner"
  value       = aws_cognito_user_pool.userpool.id
}
output "user_pool_domain" {
  value = aws_cognito_user_pool_domain.domainpool.id
}
output "domain_s3_bucket" {
  description = "The S3 bucket where the static files for this domain are stored"
  value       = aws_cognito_user_pool_domain.domainpool.id
}

#aws_cognito_

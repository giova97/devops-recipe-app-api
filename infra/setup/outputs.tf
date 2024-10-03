output "cd_user_access_key_id" {
  description = "The access key ID for the CD user"
  value       = aws_iam_access_key.cd.id
}

output "cd_user_secret_access_key" {
  description = "The secret access key for the CD user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true
}

output "cd_user_arn" {
  description = "The ARN for the CD user"
  value       = aws_iam_user.cd.arn
}


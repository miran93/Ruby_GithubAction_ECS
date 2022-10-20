resource "aws_ssm_parameter" "access_key" {
  name        = "ACCESS_KEY_ID"
  description = "Access key Id to S3 bucket"
  type        = "String"
  value       = var.AWS_ACCESS_KEY_ID

  tags = {
    environment = "production"
    project = var.tag
  }
}

resource "aws_ssm_parameter" "access_secret" {
  name        = "SECRET_ACCESS_KEY"
  description = "Access key Id to S3 bucket"
  type        = "String"
  value       = var.AWS_ACCESS_KEY_SECRET

  tags = {
    environment = "production"
    project = var.tag
  }
}
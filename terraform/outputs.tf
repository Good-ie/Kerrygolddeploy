output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.web.public_dns
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}

output "aws_region" {
  value = var.aws_region
}
# S3 Bucket outputs
output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.arn
}

output "s3_bucket_region" {
  description = "Region of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.region
}

# S3 bucket URL (console)
output "s3_bucket_url" {
  description = "S3 bucket URL in AWS console"
  value       = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.terraform_state.bucket}"
}

# DynamoDB Table outputs
output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.terraform_lock.name
}

output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.terraform_lock.arn
}

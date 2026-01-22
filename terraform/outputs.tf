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

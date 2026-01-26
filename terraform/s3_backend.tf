# S3 Bucket to store Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "kerrygold-terraform-state"  # Ensure this is globally unique
  acl    = "private"

  lifecycle {
    prevent_destroy = false  # Prevent accidental deletion of the bucket
  }
}

# S3 Bucket Versioning (deprecated versioning moved to a separate resource)
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "kerrygold-terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}

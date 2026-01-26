terraform {
  backend "s3" {
    bucket         = "kerrygold-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"  # Use your actual region
    dynamodb_table = "kerrygold-terraform-lock"
    encrypt        = true
  }
}
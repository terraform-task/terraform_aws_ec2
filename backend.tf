terraform {
  backend "s3" {
    bucket         = "my-ec2-project-tfstate-26mar"   # Replace with your S3 bucket name
    key            = "eks/terraform.tfstate"       # Path inside the bucket
    region         = "ap-south-1"                   # AWS region
    dynamodb_table = "my-ec2-project-tflock-26mar"              # Replace with your DynamoDB table
    encrypt        = true
  }
}
# This configuration sets up the backend for Terraform to use S3 for state management
# and DynamoDB for state locking, ensuring safe concurrent operations.
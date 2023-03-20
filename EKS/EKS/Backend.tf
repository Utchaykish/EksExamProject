terraform {
  backend "s3" {
    # Name of the bucket
    bucket = "utchay-terraform"
    key = "utchay/terraform/terraform.tfstate"
    region = "us-east-1"


     # DynamoDB table name
    dynamodb_table = "terraform-test-locks"
    encrypt = true
  }
}

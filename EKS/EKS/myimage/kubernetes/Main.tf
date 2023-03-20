terraform {
  backend "s3" {
    bucket         = "utchay-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-test-locks"
  }
}

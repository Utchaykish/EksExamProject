resource "aws_s3_bucket" "terraform-state" {
    bucket = "utchay-terraform"
    # Enable versioning
    versioning {
      enabled = true
    }
    # Enable server-side encryption(SSE)
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
      }
    }
 }
}

resource "aws_dynamodb_table" "terraform_locks" {
    hash_key = "LockID"
    name = "terraform-test-locks"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "LockID"
      type = "S"
    }
}

# Create a .pem file
# RSA key of size 2048 bits
resource "tls_private_key" "new-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_sensitive_file" "private_key" {
  filename          = "${var.namespace}-key.pem"
  content = tls_private_key.new-key.private_key_pem
  file_permission   = "0700"
}


# Create a Key Pair
resource "aws_key_pair" "nodekey" {
  key_name   = "${var.namespace}-key"
  public_key = tls_private_key.new-key.public_key_openssh

}
#output
output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.nodekey.key_name
}
variable "namespace" {
  type        = string
  description = "Namespace, which could be your company name."
  default = "utchaykey"
}

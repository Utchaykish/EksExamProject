variable "cluster" {
  default = "utchaykish-cluster"
}
variable "app" {
  type        = string
  description = "Name of Application"
  default     = "myimage"
}
variable "zone" {
  default = "us-east-1"
}
variable "docker-image" {
  type        = string
  description = "A docker-tweet-app"
  default     = "utchaykish/myimage:1.1.0"
}
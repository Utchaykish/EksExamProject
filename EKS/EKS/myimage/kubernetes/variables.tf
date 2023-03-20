variable "cluster" {
  default = "utchaykey-cluster"
}
variable "app" {
  type        = string
  description = "Name of Application"
  default     = "myimage-app"
}
variable "zone" {
  default = "us-east-1"
}
variable "docker-image" {
  type        = string
  description = "A docker-tweet-app"
  default     = "utchaykish/myimage:1.0"
}

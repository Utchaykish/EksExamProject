variable "pub_subnets" {
    type = list(string)
}
variable "priv_subnets" {
    type = list(string)
}

variable "key_name" {
    type = string
}

variable "priv_subnet_id_1"{
  type = string
  }

variable "priv_subnet_id_2"{ type = string }
variable "pub_subnet_id_1"{ type = string }
variable "pub_subnet_id_2"{ type = string }

variable "namespace" {
  type        = string
  description = "Any name of your choosing"
  default = "utchaykey"
}
variable "project-tag" {
    type = map(string)
    default = {
      Terraform   = "true"
      Environment = "utchaykey"
  }
}
variable "availability_zones" {
    type = list(string)
}
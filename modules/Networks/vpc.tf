  GNU nano 4.8                                                                                                                                                                                                                                    vpc.tf                                                                                                                                                                                                                                               
# Create the VPC
resource "aws_vpc" "Eks_project" {
  cidr_block       = var.main_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = var.project-tag
}


# Create Private Subnets.
resource "aws_subnet" "privatesubnet_1" {
  vpc_id = aws_vpc.Eks_project.id
  cidr_block = "${var.private_subnets[0]}"
#  availability_zone       = data.aws_availability_zones.zones.names[0]
  availability_zone = var.availability_zones[0]
  tags = {
    "Name" = "${var.namespace}-private-subnet-1"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.namespace}-cluster" = "owned"
  }
}

resource "aws_subnet" "privatesubnet_2" {
  vpc_id = aws_vpc.Eks_project.id
  cidr_block = "${var.private_subnets[1]}"
#  availability_zone       = data.aws_availability_zones.zones.names[0]
  availability_zone = var.availability_zones[1]
  tags = {
    "Name" = "${var.namespace}-private-subnet-2"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.namespace}-cluster" = "owned"
  }
}


# Create Public Subnets.
resource "aws_subnet" "publicsubnet_1" {
  vpc_id = aws_vpc.Eks_project.id
  cidr_block = "${var.public_subnets[0]}"
  map_public_ip_on_launch = true
  # availability_zone       = data.aws_availability_zones.zones.names[1]
  availability_zone = var.availability_zones[0]
  tags = {
    "Name" = "${var.namespace}-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.namespace}-cluster" = "owned"
  }
}

resource "aws_subnet" "publicsubnet_2" {
  vpc_id = aws_vpc.Eks_project.id
  cidr_block = "${var.public_subnets[1]}"
  map_public_ip_on_launch = true
  # availability_zone       = data.aws_availability_zones.zones.names[2]
  availability_zone = var.availability_zones[1]
  tags = {
    "Name" = "${var.namespace}-public-subnet-2"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.namespace}-cluster" = "owned"
  }
}


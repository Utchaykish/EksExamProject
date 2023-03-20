 Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "Int_gateway" {
  vpc_id = aws_vpc.Eks_project.id
  tags = var.project-tag
}
# Create NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
  tags = var.project-tag
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.publicsubnet_1.id
  tags = var.project-tag
  depends_on = [
    aws_internet_gateway.Int_gateway
  ]
}

# Private Route Table
resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.Eks_project.id
  route {
    cidr_block = var.destination_cidr_block
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = var.project-tag
}
# Route table for Public Subnets
resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.Eks_project.id
  route {
    cidr_block = var.destination_cidr_block
    gateway_id = aws_internet_gateway.Int_gateway.id
  }
  tags = var.project-tag
}

# Route table Association with Private Subnets
resource "aws_route_table_association" "Private_RTassociation_1" {
  subnet_id = aws_subnet.privatesubnet_1.id
  route_table_id = aws_route_table.Private_RT.id
}

resource "aws_route_table_association" "Private_RTassociation_2" {
  subnet_id = aws_subnet.privatesubnet_2.id
  route_table_id = aws_route_table.Private_RT.id
}

# Route table Association with Public Subnets
resource "aws_route_table_association" "Public_RTassociation_1" {
  subnet_id = aws_subnet.publicsubnet_1.id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route_table_association" "Public_RTassociation_2" {
    subnet_id = aws_subnet.publicsubnet_2.id
    route_table_id = aws_route_table.Public_RT.id
}


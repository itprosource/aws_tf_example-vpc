# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = {
    Name = var.name
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  cidr_block = var.public_subnet
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.az

  tags = {
    Name = "${var.name}-public"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  cidr_block = var.private_subnet
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.az

  tags = {
    Name = "${var.name}-private"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.name
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_internet_gateway.igw]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.name}-public"
  }
}

# Associate public route table to public subnet
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-private"
  }
}

# Associate private route table to private subnet
resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
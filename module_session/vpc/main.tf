resource "aws_vpc" "tfvpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "TFVPC"
  }
}

resource "aws_subnet" "tfsub1" {
  vpc_id                  = aws_vpc.tfvpc.id
  cidr_block              = var.cidr_block_s1
  availability_zone       = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "tfsub1"
  }
}

resource "aws_subnet" "tfsub2" {
  vpc_id                  = aws_vpc.tfvpc.id
  cidr_block              = var.cidr_block_s2
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = {
    Name = "tfsub2"
  }
}

resource "aws_internet_gateway" "tfig" {
  vpc_id = aws_vpc.tfvpc.id
  tags = {
    Name = "tfig"
  }
}

resource "aws_route_table" "tfrt" {
  vpc_id = aws_vpc.tfvpc.id
  route {
    cidr_block = var.cidr_rt
    gateway_id = aws_internet_gateway.tfig.id
  }
  tags = {
    Name = "tfrt"
  }
}

resource "aws_route_table_association" "tfrta1" {
  route_table_id = aws_route_table.tfrt.id
  subnet_id      = aws_subnet.tfsub1.id
}

resource "aws_route_table_association" "tfrta2" {
  route_table_id = aws_route_table.tfrt.id
  subnet_id      = aws_subnet.tfsub2.id
}
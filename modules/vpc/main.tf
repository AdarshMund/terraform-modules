resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

    tags = var.vpc_name
}

# public subnet 

resource "aws_subnet" "public" {

  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.az_1
  map_public_ip_on_launch = var.map_public_ip 

  tags = var.public_subnet_tags

}

# private subnet

resource "aws_subnet" "private" {

  vpc_id = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.az_2
  tags = var.private_subnet_tags
}

# internet gateway

resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = var.igw_tags
}

# Elastic IP

resource "aws_eip" "nat" {

  domain = "vpc"
  tags = var.eip_tags
}

# NAT gateway 

resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public.id

  depends_on = [aws_internet_gateway.this]

  tags = var.nat_tags
}

# Public Route table

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id

  tags = var.public_rt_tags

}

resource "aws_route" "public" {

  route_table_id = aws_route_table.public.id
  destination_cidr_block = var.internet_cidr
  gateway_id = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {

  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# private Route table

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.this.id

  tags = var.private_rt_tags
}

resource "aws_route" "private" {

  route_table_id = aws_route_table.private.id
  destination_cidr_block = var.internet_cidr
  nat_gateway_id = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "private" {

  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

}

# Security Group

resource "aws_security_group" "this" {

  name = var.sg_name
  vpc_id = aws_vpc.this.id
  description = var.sg_description

  ingress {

    from_port = var.ingress_ssh.from_port
    to_port     = var.ingress_ssh.to_port
    protocol    = var.ingress_ssh.protocol
    cidr_blocks = var.ingress_ssh.cidr_blocks

  }

  ingress {

    from_port = var.ingress_http.from_port
    to_port     = var.ingress_http.to_port
    protocol    = var.ingress_http.protocol
    cidr_blocks = var.ingress_http.cidr_blocks 

  }

  egress {
    from_port   = var.egress_all.from_port
    to_port     = var.egress_all.to_port
    protocol    = var.egress_all.protocol
    cidr_blocks = var.egress_all.cidr_blocks
  }

  tags = var.sg_tags
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "${var.open_cidr}"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name="public route table"
    env="eks-${var.env}"
  }
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "${var.open_cidr}"
    nat_gateway_id = aws_nat_gateway.ngw_1.id
  }

  tags = {
    Name="private route table 1"
    env="eks-${var.env}"
  }
}

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "${var.open_cidr}"
    nat_gateway_id = aws_nat_gateway.ngw_2.id
  }

  tags = {
    Name="private route table 2"
    env="eks-${var.env}"
  }
}
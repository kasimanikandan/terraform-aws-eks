
resource "aws_subnet" "private_subnet_1" {
  cidr_block = "${var.cidr_private_subnet_1}"
  vpc_id     = aws_vpc.eks_vpc.id
  availability_zone = "${var.az_1}"

  tags={
    Name="private-${var.az_1}"
    "kubernetes.io/cluster/eks"="shared"
    "kubernetes.io/role/elb"=1
    env="eks-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  cidr_block = "${var.cidr_private_subnet_2}"
  vpc_id     = aws_vpc.eks_vpc.id
  availability_zone = "${var.az_2}"

  tags={
    Name="private-${var.az_2}"
    "kubernetes.io/cluster/eks"="shared"
    "kubernetes.io/role/elb"=1
    env="eks-${var.env}"
  }
}

output "private_subnet_id_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private_subnet_2.id
}
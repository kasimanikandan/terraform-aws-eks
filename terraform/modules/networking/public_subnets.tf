
resource "aws_subnet" "public_subnet_1" {
  cidr_block = "${var.cidr_public_subnet_1}"
  vpc_id     = aws_vpc.eks_vpc.id
  availability_zone = "${var.az_1}"
  map_public_ip_on_launch = true

  tags={
    Name="public-${var.az_1}"
    "kubernetes.io/cluster/eks"="shared"
    "kubernetes.io/role/elb"=1
    env="eks-${var.env}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  cidr_block = "${var.cidr_public_subnet_2}"
  vpc_id     = aws_vpc.eks_vpc.id
  availability_zone = "${var.az_2}"
  map_public_ip_on_launch = true

  tags={
    Name="public-${var.az_2}"
    "kubernetes.io/cluster/eks"="shared"
    "kubernetes.io/role/elb"=1
    env="eks-${var.env}"
  }
}


output "public_subnet_id_1" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_id_2" {
  value = aws_subnet.public_subnet_2.id
}
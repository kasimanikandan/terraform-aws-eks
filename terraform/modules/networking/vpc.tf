
resource "aws_vpc" "eks_vpc" {
  cidr_block = "${var.vpc_cidr_block}"

  instance_tenancy = "${var.instance_tenancy}"

  enable_dns_support = true

  enable_dns_hostnames = true

  enable_classiclink = false

  enable_classiclink_dns_support = false

  assign_generated_ipv6_cidr_block = false

  tags = {
    Name="eks-vpc"
    env="eks-${var.env}"
  }
}


output "eks_vpc_id" {
  value = aws_vpc.eks_vpc.id
  description="eks vpc id"
  sensitive = false
}
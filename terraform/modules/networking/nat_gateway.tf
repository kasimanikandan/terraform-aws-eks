resource "aws_nat_gateway" "ngw_1" {
  subnet_id = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.eip_1.id

  tags = {
    Name="NAT Gateway -1"
    env="eks-${var.env}"
  }
}

resource "aws_nat_gateway" "ngw_2" {
  subnet_id = aws_subnet.public_subnet_2.id
  allocation_id = aws_eip.eip_2.id

  tags = {
    Name="NAT Gateway -2"
    env="eks-${var.env}"
  }
}
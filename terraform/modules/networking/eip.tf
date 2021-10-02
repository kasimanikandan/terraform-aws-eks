resource "aws_eip" "eip_1" {
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name="Public IP 1"
    env="eks-${var.env}"
  }
}

resource "aws_eip" "eip_2" {
  depends_on = [aws_internet_gateway.igw]
   tags = {
    Name="Public IP 2"
     env="eks-${var.env}"
  }
}
# Public subnet route table association
resource "aws_route_table_association" "public_rta_1" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public_rta_2" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public_subnet_2.id
}


# Private subnet route table association
resource "aws_route_table_association" "private_rta_1" {
  route_table_id = aws_route_table.private_1.id
  subnet_id = aws_subnet.private_subnet_1.id
}

resource "aws_route_table_association" "private_rta_2" {
  route_table_id = aws_route_table.private_2.id
  subnet_id = aws_subnet.private_subnet_2.id
}

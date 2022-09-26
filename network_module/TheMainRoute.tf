resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.publictable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.maingw.id
}
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.privatetable.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id
}
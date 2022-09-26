#hello
#associate the two public subnets with the mainroute table 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Public1.id
  route_table_id = aws_route_table.publictable.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Public2.id
  route_table_id = aws_route_table.publictable.id
}
#associate the two private subnets with the private route table 
resource "aws_route_table_association" "private_assoc1" {
  subnet_id      = aws_subnet.Private1.id
  route_table_id = aws_route_table.privatetable.id
}
resource "aws_route_table_association" "private_assoc2" {
  subnet_id      = aws_subnet.Private2.id
  route_table_id = aws_route_table.privatetable.id
}
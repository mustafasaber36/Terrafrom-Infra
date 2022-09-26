resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.elastic.id
  subnet_id     = aws_subnet.Public1.id
  tags = {
    Name = "NAT Gateway"
  }
  depends_on = [aws_internet_gateway.maingw]
}
#===============Elastic IP======================
resource "aws_eip" "elastic" {
  tags = {
    name = "elasticip"
  }
}

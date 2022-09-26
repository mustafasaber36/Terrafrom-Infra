#Route table for the public subnets to the igw
resource "aws_route_table" "publictable" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "public table"
  }
}
resource "aws_route_table" "privatetable" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "Private Table"
  }
}
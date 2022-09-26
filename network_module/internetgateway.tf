resource "aws_internet_gateway" "maingw" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "Intenet Gateway"
  }
}
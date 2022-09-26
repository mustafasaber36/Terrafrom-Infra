
#============First Public=================

resource "aws_subnet" "Public1" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.subnet_cidr_public1
  availability_zone = var.available_zone_1
  tags = {
    Name = "First public us-east-1a"
  }
}

#============Second Public=================

resource "aws_subnet" "Public2" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.subnet_cidr_public2
  availability_zone = var.available_zone_2

  tags = {
    Name = "Second Public us-east-1b"
  }
}
#============First_Private=================
resource "aws_subnet" "Private1" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.subnet_cidr_private1
  availability_zone = var.available_zone_1
  tags = {
    Name = "First Private us-east-1a"
  }
}
#============Second_Private=================
resource "aws_subnet" "Private2" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.subnet_cidr_private2
  availability_zone = var.available_zone_2
  tags = {
    Name = "Second Private us-east-1b"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH only anywhere"
  vpc_id      = aws_vpc.mainvpc.id
#connect ssh from anywhere to public subnets
  ingress {
    description      = "SSH To Public Subnet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  #connect from public subnet to all
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
    Name = "allow_ssh"
  }
  }

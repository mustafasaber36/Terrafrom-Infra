#==============Data Section==================
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
#===============Public_Bastion================
resource "aws_instance" "Bastion" {
  ami             = data.aws_ami.ubuntu.id
  subnet_id = aws_subnet.Public1.id
  instance_type   = "t2.micro"
  key_name        = "KeyPair1.pem"
  vpc_security_group_ids=[ aws_security_group.allow_ssh.id ]
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_Bastion_ip.txt"
}
}
#===============Private_Application================
resource "aws_instance" "Application" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    key_name      = "KeyPair1.pem"
    subnet_id     = aws_subnet.Private1.id
    vpc_security_group_ids=[ aws_security_group.allow_ssh_http.id ]
  }
output "vpc_id" {
    value = aws_vpc.mainvpc.id
}
output "web_instance_ip" {
    value = aws_instance.Bastion.public_ip
}

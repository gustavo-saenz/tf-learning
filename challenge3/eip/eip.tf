variable "ec2id" {
  type = string
}

resource "aws_eip" "webip" {
  instance = var.ec2id
}

output "PublicIP" {
  value = aws_eip.webip.public_ip
}
variable "sshkey" {
    type = string
}

variable "ec2name" {
  type = string
}

resource "aws_instance" "dbserver" {
  ami = "ami-08ec94f928cf25a9d"
  instance_type = "t2.micro"
  key_name = var.sshkey

  tags = {
    Name =  var.ec2name
  }
}

output "PrivateIP" {
  value = aws_instance.dbserver.private_ip
}
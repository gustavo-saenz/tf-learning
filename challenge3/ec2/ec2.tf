variable "ec2name" {
    type = string
}

variable "sshkey" {
    type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-08ec94f928cf25a9d"
  instance_type = "t2.micro"
  key_name = var.sshkey
  tags = {
    Name = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
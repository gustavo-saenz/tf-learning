variable "sgname" {
  type = string
}

variable "sshkey" {
  type = string
}

variable "ec2name" {
  type = string
}

resource "aws_instance" "web" {
  ami = "ami-08ec94f928cf25a9d"
  instance_type = "t2.micro"
  security_groups = [var.sgname]
  key_name = var.sshkey
  user_data = file("./apache.sh")

  tags = {
    Name = var.ec2name
  }
}

output "ec2id" {
  value = aws_instance.web.id
}

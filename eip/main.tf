provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-08ec94f928cf25a9d"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  key_name = "Gustavo home access"
  user_data = "${file("apache.sh")}"

  tags = {
    Name = "terraformec2"
  }
}

variable "ingressports" {
  type =list(number)
  default = [22,80,443]
  
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS and SSH"

  dynamic ingress {
    iterator = port
    for_each = var.ingressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }

  dynamic egress {
    iterator = port
    for_each = var.ingressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
  }
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}
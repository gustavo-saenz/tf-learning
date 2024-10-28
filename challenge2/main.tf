provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "dbserver" {
  ami = "ami-08ec94f928cf25a9d"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  key_name = "Gustavo home access"

  tags = {
    Name = "DB Server"
  }
}



variable "ingressports" {
  type = list(number)
  default = [22,80,443]
}

variable  "egressports" {
    type = list(number)
    default = [22,80,443,3306]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTP, HTTPS and SSH"

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
    for_each = var.egressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
  }
}

resource "aws_eip" "webip" {
  instance = aws_instance.WebServer.id
}

output "privateIP" {
  value = aws_instance.dbserver.private_ip
}

output "webserverIP" {
  value = aws_eip.webip.public_ip
}
variable "ingressports" {
  type = list(number)
}

variable "egressports" {
  type = list(number)
}

variable "sgname" {
  type = string
}

resource "aws_security_group" "webtraffic" {
  name = var.sgname

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

output "sg_name" {
  value = aws_security_group.webtraffic.name
}
provider "aws" {
    region = "eu-central-1"  
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = [ "Value1","Value2" ]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"    
    }
}

variable "inputname" {
    type = string
    description = "Enter the name of your vpc"
  
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = [ "cat", 1, "dog" ]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "TJ"
    port = [ 22, 25, 80 ]
  }
}
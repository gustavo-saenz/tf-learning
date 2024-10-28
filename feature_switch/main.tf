provider "aws" {
  region = "eu-central-1"
}

variable "environment" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-0084a47cc718c111a"
  instance_type = "t2.micro"
  count = var.environment == "prod" ? 1 : 0
}
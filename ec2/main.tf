provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-08ec94f928cf25a9d"
  instance_type = "t2.micro"

  tags = {
    Name = "terraformec2"
  }
}
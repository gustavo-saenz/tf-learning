resource "aws_instance" "ec2" {
  ami = "ami-09a799aba9115ff1c"
  instance_type = "t2.micro"
}
provider "aws" {
  region = "eu-central-1"
}

resource "aws_db_instance" "myRDS" {
  db_name = "myDB"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "11.4.3"
  username = "gustavo"
  password = "password123"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}
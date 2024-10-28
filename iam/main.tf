provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_user" "newuser" {
  name = Gustavo
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC2"

  policy = <<EOF
policy details here
  EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.newuser]
  policy_arn = aws_iam_policy.customPolicy.arn
}
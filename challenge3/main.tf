provider "aws" {
  region = "eu-central-1"
}

module "db" {
  source = "./db"
  sshkey = "Gustavo home access"
  ec2name = "Test name"
}

module "web" {
  source = "./web"
  sgname = module.sg.sg_name
  sshkey = "Gustavo home access"
  ec2name = "Web server created via tf modules"

}

module "eip" {
  source = "./eip"
  ec2id = module.web.ec2id
}

module "sg" {
  source = "./sg"
  ingressports = [22,80,443]
  egressports = [22,80,443]
  sgname = "SG modules"
}

output "PublicIP" {
  value = module.eip.PublicIP
}

output "privateIP" {
  value = module.db.PrivateIP
}
provider "aws" {
  region = var.region
}

resource "tls_private_key" "privateKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "demoKey" {
  public_key = tls_private_key.privateKey.public_key_openssh
  key_name   = "DemoKey"
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.demoKey.key_name}.pem"
  content  = tls_private_key.privateKey.private_key_pem
}

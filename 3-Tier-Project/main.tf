provider "aws" {
  region = var.region
}

resource "aws_key_pair" "demoKey" {
  public_key = var.keyPairPath
  key_name   = "DemoKey"
}

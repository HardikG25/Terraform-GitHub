resource "aws_security_group" "allow_tls" {
  name        = "${local.projectName}_allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = var.cidr_ingress
  }

  ingress {
    description = "TLS from VPC"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = var.cidr_ingress
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = var.cidr_ingress
  }

  tags = local.tags
}


resource "aws_security_group" "allow_tls_db" {
  name        = "${local.projectName}_allow_tls_db"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = var.cidr_ingress
  }

  ingress {
    description = "TLS from VPC"
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    cidr_blocks = var.cidr_ingress
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = var.cidr_ingress
  }

  tags = merge(
    { Name = "allow_tls_db" },
    local.tags
  )
}



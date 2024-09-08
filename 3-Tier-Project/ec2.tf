resource "aws_instance" "web_disp" {
  ami                         = "ami-0182f373e66f89c85"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.demoKey.key_name
  subnet_id                   = aws_subnet.public_sub[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = var.public_subnet_count

  tags = merge(
    { Name = "Web Server" },
    local.tags
  )

  provisioner "file" {
    source      = "Source of the pem file"
    destination = "Path to be given to source file"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = aws_key_pair.demoKey
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "dataBase" {
  ami                    = "ami-0182f373e66f89c85"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.demoKey.key_name
  subnet_id              = aws_subnet.private_sub.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = merge(
    { Name = "DataBase Server" },
    local.tags
  )
}

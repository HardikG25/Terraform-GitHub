resource "aws_nat_gateway" "natGateway" {
  allocation_id = aws_eip.elasticIp.id
  subnet_id     = aws_subnet.public_sub[0].id
  tags = merge(
    { Name = "NAT Gateway" },
    local.tags
  )

  depends_on = [aws_internet_gateway.internetGtw]
}

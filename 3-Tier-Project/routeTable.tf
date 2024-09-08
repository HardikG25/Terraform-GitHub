resource "aws_route_table" "customRoute" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGtw.id
  }

  tags = merge(
    { Name = "Custom Route Table" },
    local.tags
  )
}

resource "aws_route_table_association" "rtA" {
  subnet_id      = aws_subnet.public_sub[count.index].id
  route_table_id = aws_route_table.customRoute.id
  count          = var.public_subnet_count
}

# Adding NAT Gateway to default route table
resource "aws_default_route_table" "dfltRouteTable" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGateway.id
  }

  tags = merge(
    { Name = "Default Route Table" },
    local.tags
  )
}

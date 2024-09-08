resource "aws_internet_gateway" "internetGtw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(
    { Name = "Internet Gateway" },
    local.tags
  )
}

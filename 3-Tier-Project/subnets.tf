resource "aws_subnet" "public_sub" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_sub_cidr[count.index]
  availability_zone = var.availabilityZones[count.index]
  count             = var.public_subnet_count

  tags = merge(
    { Name = "public_subnet" },
    local.tags
  )
}

resource "aws_subnet" "private_sub" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_sub_cidr[count.index]
  availability_zone = var.availabilityZones[1]
  count             = var.private_subnet_count

  tags = merge(
    { Name = "private_subnet" },
    local.tags
  )
}

data "aws_subnets" "sid" {
  filter {
    name   = "${local.projectName}-vpc-id"
    values = [aws_vpc.my_vpc.id]
  }

  tags = local.tags
}

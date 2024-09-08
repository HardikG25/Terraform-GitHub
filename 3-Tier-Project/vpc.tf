resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = merge(
    { Name = "demo_vpc" },
    local.tags
  )
}

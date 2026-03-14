#create vpc
# create internetgateway and attach to vpc

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = local.vpc_final_tags
}

#Internet gatway creation

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id #vpc association

  tags = local.igw_final_tags
}

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

#public subnets
resource "aws_subnet" "public" {
  #we will get two subnets
  count = length(var.public_subnets_cidr)
  vpc_id     = aws_vpc.main.id

  #cidr_block = "10.0.1.0/24"
  cidr_block = var.public_subnets_cidr[count.index]

  # available zones we need to get dynamically
  availability_zone = local.az_names[count.index]

  #to get the publicip
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    #roboshop-dev-public-us-east-1a
    {
      Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
    },
    var.public_subnet_tags
  )
}

#private subnets
resource "aws_subnet" "private" {
  #we will get two subnets
  count = length(var.private_subnets_cidr)
  vpc_id     = aws_vpc.main.id

  #cidr_block = "10.0.1.0/24"
  cidr_block = var.private_subnets_cidr[count.index]

  # available zones we need to get dynamically
  availability_zone = local.az_names[count.index]

  tags = merge(
    local.common_tags,
    #roboshop-dev-private-us-east-1a
    {
      Name = "${var.project}-${var.environment}-private-${local.az_names[count.index]}"
    },
    var.private_subnet_tags
  )
}

#database subnets
resource "aws_subnet" "database" {
  #we will get two subnets
  count = length(var.database_subnets_cidr)
  vpc_id     = aws_vpc.main.id

  #cidr_block = "10.0.1.0/24"
  cidr_block = var.database_subnets_cidr[count.index]

  # available zones we need to get dynamically
  availability_zone = local.az_names[count.index]

  tags = merge(
    local.common_tags,
    #roboshop-dev-database-us-east-1a
    {
      Name = "${var.project}-${var.environment}-database-${local.az_names[count.index]}"
    },
    var.database_subnet_tags
  )
}

#public route_table creation
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id # vpc association

  route = []

  tags = merge(
    local.common_tags,
    #roboshop-dev-public
    {
      Name = "${var.project}-${var.environment}-public"
    },
    var.public_route_table_tags
  )
}

#private route_table creation
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id # vpc association

  route = []

  tags = merge(
    local.common_tags,
    #roboshop-dev-private
    {
      Name = "${var.project}-${var.environment}-private"
    },
    var.private_route_table_tags
  )
}

#database route_table creation
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id # vpc association

  route = []

  tags = merge(
    local.common_tags,
    #roboshop-dev-database
    {
      Name = "${var.project}-${var.environment}-database"
    },
    var.private_route_table_tags
  )
}

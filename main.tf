#create vpc
# create internetgateway and attach to vpc

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostname = true

 # tags = {
 #   Name = "main"
 # }

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}- ${var.env}"
    }
    var.vpc_tags
  )
}
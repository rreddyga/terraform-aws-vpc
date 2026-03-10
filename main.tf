#create vpc
# create internetgateway and attach to vpc

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true    # Add this - enables DNS within VPC
  enable_dns_hostnames = true    # Fixed spacing for consistency
  
  tags = local.vpc_final_tags
}

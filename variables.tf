#user has to pass in the test module
variable "project" {
    type = string
}
#user has to pass in the test module
#to understand if we are not passing default then user must pass in the test module
variable "environment" {
    type = string
}
#users can override

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_tags" {
    type = map
    default = {} # empty
}

variable "igw_tags" {
    type = map
    default = {}
}
#public cidr
variable "public_subnets_cidr" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "public_subnet_tags" {
    type = map
    default = {}
}
#private cidr
variable "private_subnets_cidr" {
    type = list
    default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "private_subnet_tags" {
    type = map
    default = {}
}
#database cidr
variable "database_subnets_cidr" {
    type = list
    default = ["10.0.21.0/24","10.0.22.0/24"]
}
variable "database_subnet_tags" {
    type = map
    default = {}
}
#route_table tags
variable "public_route_table_tags" {
     type = map
    default = {}
}
variable "private_route_table_tags" {
     type = map
    default = {}
}
variable "database_route_table_tags" {
     type = map
    default = {}
}

variable "eip_tags" {
    type = map
    default = {}
}
variable "nat_gateway_tags" {
     type = map
    default = {}
}

variable "is_vpc_peering_required" {
  description = "Enable VPC peering"
  type        = bool
  default     = false
}

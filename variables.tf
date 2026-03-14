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

variable "public_subnets_cidr" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_subnet_tags" {
    type = map
    default = {}
}
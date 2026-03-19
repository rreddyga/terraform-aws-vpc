output "az_info" {
    value = data.aws_availability_zones.available
}
output "vpc_id" {
    value = aws_vpc.main.id
}

#public subet_id we have to store ssm paramters
output "public_subnet_ids" {
    value = aws_subnet.public[*].id
}

#private subet_id we have to store ssm paramters
output "private_subnet_ids" {
    value = aws_subnet.private[*].id
}

#database subet_id we have to store ssm paramters
output "database_subnet_ids" {
    value = aws_subnet.database[*].id
}

# Terraform AWS VPC

This module  creates the following  resources

1. VPC
2. InternetGateway with VPC association
3. Subnets ->public private database
4. Route_tables -> public private database
5. Associations and Routes
6. Elastic IP (EIP)
7. NAT gateway
8. VPC peering with default VPC on condition
9. Route table entries  through peering

#inputs
project -(Required) string type,user should pass  the project name
environment -(Required) string type, user shoudl pass the environment name, values should be dev,qa and prod
$outpus
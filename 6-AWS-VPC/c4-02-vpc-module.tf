#create vpc terragorm module

module "bms_vpc_creation" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.3"

  #vpc basic Details
  name   = "${local.name}-${var.vpc_name}"
  cidr      = var.vpc_cidr_block
  azs                 = var.vpc_availability_zones
  private_subnets     =  var.vpc_private_subnets
  public_subnets      =  var.vpc_public_subnets

  # DataBase  subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets    = var.vpc_database_subnets 
   # create_database_internet_gateway_route = true
   # create_database_nat_gateway_route = true

    # NAT Gateways - Outbound Communication
    enable_nat_gateway =  var.vpc_enable_nat_gateway
    single_nat_gateway = var.vpc_single_nat_gateway

     # VPC DNS Parameters
    enable_dns_hostnames = true
    enable_dns_support   = true


    public_subnet_tags = {
    Type = "Public-Subnets"
  }
  private_subnet_tags = {
    Type = "Private-Subnets"
  }  
  database_subnet_tags = {
    Type = "Private-Database-Subnets"
  }
tags = {
    owner = "sairam"
    environment = "dev"
}

vpc_tags={
    Name= "vpc-dev"
}


} 
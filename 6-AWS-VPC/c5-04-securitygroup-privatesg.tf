#AWS EC2 Security Group Terraform Module
# Security Group for  private  ec2 instance
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"


  name = "private-sg"
  description ="security group with ssh port for every one$ outbound every oneopen(egress)"
  vpc_id =   module.vpc.vpc_id

   #ingress Rules & CIDR block ( in bound rules)
   ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
    ingress_rules = ["ssh-tcp","httpd-80-tcp"]

   # Egress Rules (out bound rules)
   egress_rules = ["all-all"]
   tags =local.common_tags



}

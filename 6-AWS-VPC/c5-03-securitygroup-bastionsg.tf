#AWS EC2 Security Group Terraform Module
# Security Group for Public bastion  Host
module  "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"


  name = "public-bastion-sg"
  description ="security group with ssh port for every one$ outbound every oneopen(egress)"
  vpc_id =  module.vpc.vpc_id

   #ingress Rules & CIDR block ( in bound rules)
   ingress_cidr_blocks = ["0.10.0.0/0"]
    ingress_rules = ["ssh-tcp"]

   # Egress Rules (out bound rules)
   egress_rules = ["all-all"]
   tags =local.common_tags



}

module "vpc" {
  source = "./vpc"
  cidr_block = "192.168.0.0/16"
  cidr_block_s1 = "192.168.1.0/24"
  az = "us-east-1b"
  cidr_rt = "0.0.0.0/0"
  cidr_block_s2 = "192.168.2.0/24"
  az2 = "us-east-1b"
}

module "lt_sg" {
  source = "./launchtemp_sg"
  vpcid = module.vpc.vpcid  
  depends_on = [ module.vpc ]
}

module "eks" {
  source = "./eks"
  subnet1 = module.vpc.subnet1
  subnet2 = module.vpc.subnet2
  sgid  = module.lt_sg.sgid
  lt_id = module.lt_sg.lt_id
  lt_version = module.lt_sg.lt_version
  depends_on = [ module.lt_sg ]
}
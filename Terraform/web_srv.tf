module "vpc" {
  source = "./vpc"
}

 module "web" {
   source = "./ec2"

    count                        = 2
    subnet_id                    = element(module.vpc.public_subnet_ids[*],count.index)
    security_group               = [module.vpc.sg_public]
    user_data                    = false #file("~/Desktop/Terraform_modules/ec2/web_srv.sh")
    key_name                     = aws_key_pair.ssh_key.key_name
    srv                          = "web"
 }

  module "db" {
   source = "./ec2"

    count                        = 1
    subnet_id                    = element(module.vpc.private_subnet_ids[*],count.index)
    security_group               = [module.vpc.sg_private]
    user_data                    = false #file("~/Desktop/Terraform_modules/ec2/db_srv.sh")
    key_name                     = aws_key_pair.ssh_key.key_name
    srv                          = "db"

 }

   module "bastion" {
   source = "./ec2"

    count                        = 1
    subnet_id                    = element(module.vpc.public_subnet_ids[*],count.index)
    security_group               = [module.vpc.bastion]
    user_data                    = false
    key_name                     = aws_key_pair.ssh_key.key_name
    srv                          = "bastion"

    
 }
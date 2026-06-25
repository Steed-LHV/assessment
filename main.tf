module "database" {
  source             = "./modules/database"
  vpc_id             = "vpc-012167c7d5110d3ef"
  private_subnet_ids = ["subnet-0a73ec09282712113", "subnet-0f571c2a3e1d05e6f"]
  
  db_username        = var.db_username
  db_password        = var.db_password
}


module "compute" {
  source             = "./modules/compute"
  vpc_id             = "vpc-012167c7d5110d3ef" 
  public_subnet_ids  = ["subnet-0e927c040a8854a75", "subnet-0a2f72f2f6efb1b61"]
  private_subnet_ids = ["subnet-0a73ec09282712113", "subnet-0f571c2a3e1d05e6f"]
}

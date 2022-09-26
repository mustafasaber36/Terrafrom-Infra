module "iti_infras" {
  source               = "/home/moustafa/Desktop/Lab2Module/network_module"
  vpc_cidr             = var.vpc_cidr
  subnet_cidr_public1  = var.subnet_cidr_public1
  subnet_cidr_public2  = var.subnet_cidr_public2
  subnet_cidr_private1 = var.subnet_cidr_private1
  subnet_cidr_private2 = var.subnet_cidr_private2
  region               = var.region
  available_zone_1     = var.available_zone_1
  available_zone_2     = var.available_zone_2
}
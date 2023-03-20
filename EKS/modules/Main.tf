module "Networks" {
  source = "/root/Eks/modules/Networks"
  namespace = var.namespace
  destination_cidr_block = var.destination_cidr_block
  main_vpc_cidr = var.main_vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
}

module "ssh_key" {
  source = "/root/Eks/modules"
  }

module "eks_cluster" {
  source = "/root/Eks/modules/eks_cluster_module"
  namespace = var.namespace
  pub_subnets = module.Networks.public_subnets
  priv_subnets = module.Networks.private_subnets
  availability_zones = var.availability_zones
  priv_subnet_id_1 = module.Networks.private_subnet_id_1
  priv_subnet_id_2 = module.Networks.private_subnet_id_2
  pub_subnet_id_1 = module.Networks.pub_subnet_1
  pub_subnet_id_2 = module.Networks.pub_subnet_2
  key_name = module.ssh_key.key_name
}

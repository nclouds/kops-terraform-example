module "network" {
  source          = "./modules/vpc"
  environment     = terraform.workspace
  vpc             = var.vpc
  cluster_name    = "nclouds-kops-example"
}

module "kubernetes" {
  source              = "./modules/kubernetes"
  vpc                 = module.network.vpc
  public_subnets  = module.network.public_subnets
  private_subnets = module.network.private_subnets
  kops_cluster    = var.kops_cluster
}

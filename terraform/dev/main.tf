provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "dev_env_network" {
  source = "../modules/networking"
  #vpc_id = module.dev_env_network.eks_vpc_id
  vpc_cidr_block=var.vpc_cidr_block
  instance_tenancy=var.instance_tenancy
  az_1 = var.az_1
  az_2=var.az_2
  cidr_public_subnet_1=var.cidr_public_subnet_1
  cidr_public_subnet_2=var.cidr_public_subnet_2
  cidr_private_subnet_1=var.cidr_private_subnet_1
  cidr_private_subnet_2=var.cidr_private_subnet_2
  env = var.env
}

module "dev_iam_role" {
  source = "../modules/iam"
}

module "dev_env_cluster" {
  source = "../modules/eks"
  public_subnet_id_1=module.dev_env_network.public_subnet_id_1
  public_subnet_id_2=module.dev_env_network.public_subnet_id_2
  private_subnet_id_1=module.dev_env_network.private_subnet_id_1
  private_subnet_id_2=module.dev_env_network.private_subnet_id_2
  eks_cluster_arn=module.dev_iam_role.eks_cluster_arn
  node_group_arn=module.dev_iam_role.eks-node-group-arn
}
variable "eks_cluster_arn" {}
variable "node_group_arn" {}
variable "private_subnet_id_1" {}
variable "private_subnet_id_2" {}
variable "public_subnet_id_1" {}
variable "public_subnet_id_2" {}

variable "kube_version" {default = "1.20"}
variable "cluster_name" {default = "eks-clsuter"}
variable "node_group_name" {default = "nodes-general"}

#worker node capacity
variable "desired_size" {default = 1}
variable "max_size" {default = 1}
variable "min_size" {default = 1}
variable "ami_type" {default = "AL2_x86_64"}
variable "capacity_type" {default = "ON_DEMAND"}
variable "disk_size" {default = 20}
variable "force_update_version" {default = false}
variable "instance_types" {default = "t2.micro"}
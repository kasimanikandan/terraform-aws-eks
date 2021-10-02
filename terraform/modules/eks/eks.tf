
resource "aws_eks_cluster" "eks" {
  name     = "${var.cluster_name}"
  role_arn = "${var.eks_cluster_arn}"
  version = "${var.kube_version}"
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
    subnet_ids = [
      "${var.public_subnet_id_1}",
      "${var.public_subnet_id_2}",
      "${var.private_subnet_id_1}",
      "${var.private_subnet_id_2}",
    ]
  }

#  depends_on = [
#  aws_iam_role_policy_attachment.eks_cluster_policy
#  ]
}
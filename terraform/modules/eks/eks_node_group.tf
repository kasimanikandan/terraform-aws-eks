

resource "aws_eks_node_group" "nodes_general" {
  cluster_name  = "${aws_eks_cluster.eks.name}"
  node_group_name = "${var.node_group_name}"
  node_role_arn = "${var.node_group_arn}" # from role
  subnet_ids    = [
      "${var.private_subnet_id_1}",
      "${var.private_subnet_id_2}",
  ]
  scaling_config {
    desired_size = "${var.desired_size}"
    max_size     = "${var.max_size}"
    min_size     = "${var.min_size}"
  }

  ami_type = "${var.ami_type}"

  capacity_type = "${var.capacity_type}"

  disk_size = "${var.disk_size}"

  force_update_version = "${var.force_update_version}"

  instance_types = ["${var.instance_types}"]

  labels = {
    role="nodes-general"
  }

  version = "${var.kube_version}"

#  depends_on = [
#    aws_iam_role_policy_attachment.aws_eks_worker_node_policy_general,
#    aws_iam_role_policy_attachment.aws_eks_cni_policy_general,
#    aws_iam_role_policy_attachment.aws_ec2_container_registry_read_only,
#  ]
}
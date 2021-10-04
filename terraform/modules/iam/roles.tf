resource "aws_iam_role" "eks_cluster" {
  name="eks-cluster"
  assume_role_policy = <<EOF
{
        "Version":"2012-10-17",
        "Statement":[
          {
            "Effect":"Allow",
            "Principal":{
                "Service":"eks.amazonaws.com"
              },
            "Action":"sts:AssumeRole"
          }
        ]
      }
      EOF
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}


output "eks_cluster_arn" {
  value = aws_iam_role.eks_cluster.arn
}



resource "aws_iam_role" "nodes_general" {
  name = "eks-node-group-genernal"
  assume_role_policy = <<EOF
{
        "Version":"2012-10-17",
        "Statement":[
          {
            "Effect":"Allow",
            "Principal":{
                "Service":"ec2.amazonaws.com"
              },
            "Action":"sts:AssumeRole"
          }
        ]
      }
      EOF
}

resource "aws_iam_role_policy_attachment" "aws_eks_worker_node_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes_general.name
}


resource "aws_iam_role_policy_attachment" "aws_eks_cni_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes_general.name
}

resource "aws_iam_role_policy_attachment" "aws_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes_general.name
}

output "eks-node-group-arn" {
  value = "${aws_iam_role.nodes_general.arn}"
}

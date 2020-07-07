resource "aws_eks_cluster" "cluster" {
  name     = local.cluster_name
  role_arn = aws_iam_role.eks-master.arn
  version  = local.cluster_version

  vpc_config {
    security_group_ids = ["${aws_security_group.eks-master.id}"]
    subnet_ids = aws_subnet.sn.*.id
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster,
    aws_iam_role_policy_attachment.eks-service,
  ]

  tags = local.default_tags
}

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = local.node_group_name
  node_role_arn   = aws_iam_role.eks-worker.arn
  subnet_ids      = aws_subnet.sn.*.id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-worker-node,
    aws_iam_role_policy_attachment.eks-cni,
    aws_iam_role_policy_attachment.ecr-ro,
  ]

  tags = local.default_tags
}
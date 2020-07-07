# --- Master ---
resource "aws_iam_role" "eks-master" {
  name = local.master_user_name
  assume_role_policy = data.aws_iam_policy_document.eks_master_role_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "eks-cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-master.name
}

resource "aws_iam_role_policy_attachment" "eks-service" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks-master.name
}

# --- Worker ---
resource "aws_iam_role" "eks-worker" {
  name = local.worker_user_name

  assume_role_policy = data.aws_iam_policy_document.eks_master_role_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "eks-worker-node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-worker.name
}

resource "aws_iam_role_policy_attachment" "eks-cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-worker.name
}

resource "aws_iam_role_policy_attachment" "ecr-ro" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-worker.name
}

resource "aws_iam_instance_profile" "eks-node" {
  name = "eks-node-profile"
  role = aws_iam_role.eks-worker.name
}
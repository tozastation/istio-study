output "eks_cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "eks_cluster_certificat_authority" {
  value = aws_eks_cluster.cluster.certificate_authority 
}

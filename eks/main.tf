provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = "arn:aws:iam::123456789012:role/EKS-Cluster-Role"

  vpc_config {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}

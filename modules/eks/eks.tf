resource "aws_iam_role" "eks_role" {

    name = "eks_role"
    assume_role_policy = data.aws_iam_policy_document.assume_policy_document
  
}

data "aws_iam_policy_document" "assume_policy_document" {
    statement {
      actions = ["sts:AssumeRole"]
      principals {
        type = "Service"
        identifiers = ["eks.amazon.com"]
      }

    }
  
}


resource "aws_eks_cluster" "eks_cluster" {

    name = "eks_cluster"
    version = "1.20"
    role_arn = aws_iam_role.eks_role.arn
  
}

resource "aws_eks_node_group" "eks_node_group" {

    cluster_name = aws_eks_cluster.eks_cluster.name
    node_group_name = "eks_node_group"
    ami_type = "AL2_x86_64"
    instance_types = "t3.small"
    subnets = [
    "subnet-abc123",
    "subnet-def456"
    ]
    security_groups = [
    "sg-abc123",
    "sg-def456"
    ]
    
}
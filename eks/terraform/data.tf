data "aws_iam_policy_document" "eks_master_role_assume_policy" {
    statement {
        
        principals {
            type = "Service"
            identifiers = ["eks.amazonaws.com"]
        }

        actions = ["sts:AssumeRole"]
    }
}

data "aws_iam_policy_document" "eks_worker_role_assume_policy" {
    statement {
        
        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }

        actions = ["sts:AssumeRole"]
    }
}

data "aws_availability_zones" "available-zone" {
    state = "available"
}

# IAM Role with AmazonEC2RoleforAWSCodeDeploy, AmazonS3FullAccess, AWSCodeDeployRole policies
resource "aws_iam_role" "test_role" {
  name = "devops-project-iamrole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
    ]

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "devops-projects"
  }
}
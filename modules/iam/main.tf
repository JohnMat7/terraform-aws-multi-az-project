# An IAM role trusted by EC2
resource "aws_iam_role" "fastapi_role" {
    name = "fastapi-s3-access-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
  }


# Attach S3 permissions to the role
resource "aws_iam_role_policy_attachment" "fastapi_s3" {
    role = aws_iam_role.fastapi_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# An instance profile containing the role.

resource "aws_iam_instance_profile" "ec2_instance_profile" {
    name = "fastapi-instance-profile"
    role = aws_iam_role.fastapi_role.name
}
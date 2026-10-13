output "instance_profile_name" {
  description = "Name of EC2 IAM instance profile"
  value = aws_iam_instance_profile.ec2_instance_profile.name
}
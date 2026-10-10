# terraform-aws-multi-az-project

## Terraform Project which covers following skills: 

Building and deploying PDF Uploader project into AWS

1) multi a-z architecture 
2) terraform modules
3) remote state locking
4) ci/cd for terraform (later when all objective will be completed)
5) security groups
6) iam roless (least privildege)
7) secrets manager
8) Cloudwatch
9) auto scaling
10) drift detection




## Work to do :
1) IAM User access (AmazonS3FullAccess, AmazonRDSFullAccess altough we have admin access)
2) S3 bucket (block access)
3) RDS PostgresSQL instance (access to be decided)


4) updating code (boto3 package , )

5) Database tier ()

6) SGs

  - Load Balancer SG: Allow Inbound HTTP/HTTPS from Anywhere (0.0.0.0/0).
  - Frontend EC2 SG: Allow Inbound HTTP only from the Load Balancer SG.
  - Backend EC2 SG: Allow Inbound HTTP/8000 only from the Frontend EC2 SG.
  - Database SG: Allow Inbound PostgreSQL (Port 5432) only from the Backend EC2 SG.

7) Compute Templates
  - Backend : EC2 instance (AmazonS3FullAccess)
  - script required to pull docker image 

   FRONTEND Template
  - script required to place docker image

8) Auto Scaling group (frontend , backend)

9) LB 
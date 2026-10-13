resource "aws_s3_bucket" "pdf-bucket" {
  bucket = var.pdf_bucket_name


  tags = {
    Name        = var.pdf_bucket_name
  }
}


resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.pdf-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
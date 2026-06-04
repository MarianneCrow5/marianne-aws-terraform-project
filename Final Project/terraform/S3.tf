# Looks up existing S3 buckets so Terraform can reference them

# Input bucket (provided by the group)
data "aws_s3_bucket" "input" {
  bucket = var.input_bucket
}

# Output bucket (provided by the group)
data "aws_s3_bucket" "output" {
  bucket = var.output_bucket
}

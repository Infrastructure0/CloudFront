###############################################################################
# S3 Bucket Output
###############################################################################
output "bucket_id" {
  description = "The Id of the s3 bucket."
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "The arn of the s3 bucket."
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name."
  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
}

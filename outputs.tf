###############################################################################
# Output - S3
###############################################################################
output "s3-bucket" {
  description = "The Id of the s3 bucket."
  value       = module.s3_bucket.bucket_id
}

output "bucket_regional_domain_name" {
  description = "The website endpoint of the s3 bucket."
  value       = module.s3_bucket.bucket_regional_domain_name
}

###############################################################################
# Output - Cloudfront
###############################################################################
output "s3-cdn" {
  description = "The domain name corresponding to the distribution."
  value       = module.cloudfront.s3-cdn
}

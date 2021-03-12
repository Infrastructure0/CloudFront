###############################################################################
# Database Output
###############################################################################
output "s3-cdn" {
  description = "The domain name corresponding to the distribution."
  value       = aws_cloudfront_distribution.cdn.domain_name
}

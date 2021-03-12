###############################################################################
# Environment
###############################################################################
aws_account_id = "XXXXXXXXXXXX" ### PLEASE UPDATE THE AWS ACCOUNT NUMBER
region         = "ca-central-1" ### PLEASE UPDATE THE AWS REGION
environment    = "Development"  ### PLEASE UPDATE YOUR ENVIRONMENT, IF NOT IN DEVELOPMENT

###############################################################################
# S3 Bucket
###############################################################################
bucket_name          = "test-test-test-test-s3-22" ### PLEASE UPDATE FOR THE BUCKET NAME
force_destroy_bucket = true
versioning_enabled   = true
acl                  = "private"
index_document       = "index.html" ### PLEASE ENSURE website section is uncommented in s3_bucket module
error_document       = "error.html" ### PLEASE ENSURE website section is uncommented in s3_bucket module

###############################################################################
# Cloudfront
###############################################################################
certificate_arn = "arn:aws:acm:us-east-1:XXXXX:certificate/XXXXX" ### PLEASE ENSURE viewer_certificate section is uncommented in cloudfront module

###############################################################################
# Terraform main config
###############################################################################
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = "~> 3.2.0"
  }
}

###############################################################################
# Providers
###############################################################################
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account_id]
}

locals {
  tags = {
    Environment = var.environment
  }
}

###############################################################################
# Modules
###############################################################################
module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name          = var.bucket_name
  force_destroy_bucket = var.force_destroy_bucket
  acl                  = var.acl

  # website = {
  #   index_document = var.index_document
  #   error_document = var.error_document
  # }

  versioning = {
    enabled = var.versioning_enabled
  }
}

module "cloudfront" {
  source = "./modules/cloudfront"

  bucket_id                   = module.s3_bucket.bucket_id
  bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name

  # viewer_certificate = {
  #   acm_certificate_arn = var.certificate_arn
  #   ssl_support_method  = "sni-only"
  # }
}

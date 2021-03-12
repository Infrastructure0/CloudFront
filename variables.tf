###############################################################################
# Variables - Environment
###############################################################################
variable "aws_account_id" {
  description = "The account ID you are building into."
}

variable "region" {
  description = "AWS Region for the S3 bucket to be created in."
}

variable "environment" {
  description = "The name of the environment, e.g. Production, Development, etc."
}

###############################################################################
# Variables - S3 Bucket
###############################################################################
variable "bucket_name" {
  description = "Name of the S3 bucket to be created."
}

variable "force_destroy_bucket" {
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
}

variable "versioning_enabled" {
  description = "A boolean that indicates if versioning to be enabled in S3 bucket"
  default     = {}
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "index_document" {
  description = "Name of index document (ex. index.html)"
}

variable "error_document" {
  description = "Name of error document (ex. error.html)"
}

###############################################################################
# Variables - Cloudfront
###############################################################################
variable "certificate_arn" {
  description = "ARN of the certificate to use in Cloudfront."
}

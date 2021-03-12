## Summary

This repo will create an S3 bucket + Cloudfront distribution with Origin Access Identity (OAI) towards the S3 bucket via bucket policy. It comes with the following modules:
  - s3_bucket
  - cloudfront

## Built with:

* Terraform (v0.13.0)
* AWS provider version (3.2.0)
* AWS_ACCESS_KEYS and AWS_SECRET_ACCESS_KEYS are set as environment variables (link: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.22.0 |

## Step by Step deployment

```

* **Step 1: Create your S3 + Cloudfront resources.** Update the `terraform.tfvars` file with your account ID, region, and fill up all required variables.
```shell script
$ cd tf-infrastructure0
$ vi terraform.tfvars
```

* **Step 2:Lastly, create your resources:**
```shell script
$ terraform init
$ terraform plan
$ terraform apply --auto-approve
```

## NOTE: If you are using your S3 bucket as a website. Uncomment the `website` section in the s3_bucket module at `main.tf` file. Also, update the `index_document` and `error_document` with their respective values in the `terraform.tfvars` file.**
```shell script
module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name          = var.bucket_name
  force_destroy_bucket = var.force_destroy_bucket
  acl                  = var.acl

  website = {
    index_document = var.index_document
    error_document = var.error_document
  }

  versioning = {
    enabled = var.versioning_enabled
  }
}
```
## NOTE: If you are using your own SSL certificate. Uncomment the `viewer_certificate` section in the cloudfront module at `main.tf` file. Also, update the `certificate_arn` with the ARN of your SSL certificate in the `terraform.tfvars` file.
```shell script
module "cloudfront" {
  source = "./modules/cloudfront"

  bucket_id                   = module.s3_bucket.bucket_id
  bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name

  viewer_certificate = {
    acm_certificate_arn = var.certificate_arn
    ssl_support_method  = "sni-only"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | The account ID you are building into. | `string` | `n/a` | yes |
| environment | The name of the environment, e.g. Production, Development, etc. | `string` | `"Development"` | yes |
| region | AWS Region for the S3 bucket to be created in. | `string` | `"ca-central-1"` | yes |
| bucket\_name | Name of the S3 bucket to be created. | `string` | `n/a` | yes |
| force\_destroy\_bucket | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `true` | yes |
| acl | (Optional) The canned ACL to apply. Defaults to 'private'. | `string` | `"private"` | yes |
| versioning\_enabled | A boolean that indicates if versioning to be enabled in S3 bucket. | `bool` | `true` | yes |
| index\_document | Name of index document (ex. index.html) | `string` | `""` | no |
| error\_document | Name of error document (ex. error.html). | `string` | `""` | no |
| certificate\_arn | ARN of the certificate to use in Cloudfront. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3-bucket | The Id of the s3 bucket. |
| bucket\_regional\_domain\_name | The website endpoint of the s3 bucket. |
| s3-cdn | The domain name corresponding to the distribution. |

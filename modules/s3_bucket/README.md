# Cloudfront module

This layer creates the S3 bucket resource.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_name | Name of the S3 bucket to be created. | `string` | `n/a` | yes |
| force\_destroy\_bucket | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `boolean` | `true` | yes |
| acl | (Optional) The canned ACL to apply. Defaults to 'private'. | `string` | `"private"` | yes |
| versioning | A map that indicates if versioning to be enabled in S3 bucket. | `map` | `{}` | yes |
| website | Map containing static web-site hosting configuration. | `map` | `{}` | yes |


## Outputs

| Name | Description |
|------|-------------|
| bucket\_id | The Id of the s3 bucket. |
| bucket\_arn | The arn of the s3 bucket. |
| bucket\_regional\_domain\_name | The bucket region-specific domain name. |

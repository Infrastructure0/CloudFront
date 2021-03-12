# Cloudfront module

This module creates the Cloudfront distribution.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_regional\_domain\_name | The bucket region-specific domain name. | `string` | `n/a` | no |
| bucket\_id | The Id of the s3 bucket. | string | `n/a` | no |
| aliases | Extra CNAMEs (alternate domain names), if any, for this distribution. | `list` | `null` | yes |
| comment | Any comments you want to include about the distribution. | `string` | `null` | no |
| default\_root\_object | The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | `string` | `null` | no |
| viewer\_certificate | The SSL configuration for this distribution. | `any` |   <pre>default = {<br>    cloudfront_default_certificate = true<br> minimum_protocol_version = "TLSv1"<br>    }<pre> | no |
| price\_class | The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100. | `string` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| s3-cdn | The domain name corresponding to the distribution. |

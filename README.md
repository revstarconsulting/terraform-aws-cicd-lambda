## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codepipeline.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | n/a | yes |
| <a name="input_build_environment_variables"></a> [build\_environment\_variables](#input\_build\_environment\_variables) | Build environment variables to be passed to CI/CD | `list(map(string))` | `[]` | no |
| <a name="input_buildspec_file"></a> [buildspec\_file](#input\_buildspec\_file) | Buildspec file | `string` | n/a | yes |
| <a name="input_cicd_role"></a> [cicd\_role](#input\_cicd\_role) | IAM Role to attach with CI/CD pipeline | `string` | n/a | yes |
| <a name="input_codestar_connection_arn"></a> [codestar\_connection\_arn](#input\_codestar\_connection\_arn) | AWS CodeStart Connection ID | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_github_repo_branch"></a> [github\_repo\_branch](#input\_github\_repo\_branch) | Name of backend repository branch | `string` | n/a | yes |
| <a name="input_github_repo_name"></a> [github\_repo\_name](#input\_github\_repo\_name) | Name of backend repository | `string` | n/a | yes |
| <a name="input_github_repo_owner"></a> [github\_repo\_owner](#input\_github\_repo\_owner) | Owner of repository | `string` | n/a | yes |
| <a name="input_pipeline_type"></a> [pipeline\_type](#input\_pipeline\_type) | Type of pipeline to be build.. e.g frotned-app, frontend-admin, eks, lambda, etc | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_s3_artifact_store"></a> [s3\_artifact\_store](#input\_s3\_artifact\_store) | Bucket where artifacts will be stored | `string` | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | vpc config attributes | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |

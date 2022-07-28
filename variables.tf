variable "environment" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}
variable "project_name" {
  type        = string
  description = "Project name"
}

variable "codestar_connection_arn" {
  description = "AWS CodeStart Connection ID"
  type        = string
  default     = ""
}

variable "github_repo_owner" {
  description = "Owner of repository"
  type        = string
}


variable "github_repo_name" {
  description = "Name of backend repository"
  type        = string
}

variable "github_repo_branch" {
  description = "Name of backend repository branch"
  type        = string
}

variable "s3_artifact_store" {
  description = "Bucket where artifacts will be stored"
  type        = string
}

variable "cicd_role" {
  description = "IAM Role to attach with CI/CD pipeline"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "pipeline_type" {
  description = "Type of pipeline to be build.. e.g frotned-app, frontend-admin, eks, lambda, etc"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "vpc_config" {
  description = "vpc config attributes"
  type        = any
  default     = {}
}

variable "buildspec_file" {
  description = "Buildspec file"
  type        = string
}

variable "build_environment_variables" {
  type        = list(map(string))
  description = "Build environment variables to be passed to CI/CD"
  default     = []
}

